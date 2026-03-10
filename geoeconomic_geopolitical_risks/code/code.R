############################################################
# GEOSPATIAL DATA SCIENCE BOOK
# RESEARCH-GRADE EUROPEAN REGIONAL DATASET
############################################################

# Install once if needed
# install.packages(c(
#   "sf", "dplyr", "readr", "stringr",
#   "eurostat", "giscoR", "janitor"
# ))

library(sf)
library(dplyr)
library(readr)
library(stringr)
library(eurostat)
library(giscoR)
library(janitor)

############################################################
# PARAMETERS
############################################################

year_target <- 2022
base_year   <- 2008
nuts_year   <- "2021"

############################################################
# HELPER FUNCTIONS
############################################################

extract_year <- function(df) {
  time_col <- names(df)[names(df) %in% c("time", "time_period", "year")][1]
  
  if (is.na(time_col)) {
    stop("No time column found in dataset.")
  }
  
  df |>
    mutate(
      year = as.numeric(str_extract(as.character(.data[[time_col]]), "\\d{4}"))
    )
}

closest_year <- function(df, year_target) {
  df |>
    filter(!is.na(year)) |>
    group_by(geo) |>
    filter(year <= year_target) |>
    slice_max(year, n = 1, with_ties = FALSE) |>
    ungroup()
}

############################################################
# 1. LOAD NUTS-2 GEOMETRY
############################################################

nuts2_sf <- giscoR::gisco_get_nuts(
  year = nuts_year,
  epsg = "4326",
  resolution = "20",
  nuts_level = "2"
) |>
  janitor::clean_names() |>
  mutate(
    nuts_id = substr(nuts_id, 1, 4)
  ) |>
  transmute(
    nuts_id,
    region_name = name_latn,
    country = cntr_code,
    geometry
  ) |>
  distinct()

############################################################
# 2. GDP PER CAPITA (PPS, EU27 = 100)
############################################################

gdp <- eurostat::get_eurostat("tgs00006") |>
  janitor::clean_names() |>
  extract_year() |>
  closest_year(year_target) |>
  transmute(
    nuts_id = substr(geo, 1, 4),
    gdp_pps_eu27 = values
  ) |>
  distinct()

############################################################
# 3. UNEMPLOYMENT RATE
############################################################

unemp <- eurostat::get_eurostat("tgs00010") |>
  janitor::clean_names() |>
  extract_year() |>
  closest_year(year_target) |>
  transmute(
    nuts_id = substr(geo, 1, 4),
    unemployment_rate = values
  ) |>
  distinct()

############################################################
# 4. NET MIGRATION RATE
############################################################

migration <- eurostat::get_eurostat("tgs00099") |>
  janitor::clean_names() |>
  extract_year() |>
  closest_year(year_target) |>
  transmute(
    nuts_id = substr(geo, 1, 4),
    net_migration_rate = values
  ) |>
  distinct()

############################################################
# 5. EMPLOYMENT DATA (EUROSTAT REGIONAL ACCOUNTS)
# Dataset: nama_10r_3empers
############################################################

emp <- eurostat::get_eurostat("nama_10r_3empers") |>
  janitor::clean_names() |>
  extract_year()

# Optional diagnostic
# names(emp)
# unique(emp$unit)
# unique(emp$nace_r2)

# Keep a standard employment unit if present
if ("unit" %in% names(emp)) {
  preferred_units <- c("THS_PER", "THS", "PER")
  unit_keep <- intersect(preferred_units, unique(emp$unit))[1]
  
  if (!is.na(unit_keep)) {
    emp <- emp |>
      filter(unit == unit_keep)
  }
}

# Total employment
total_emp <- emp |>
  filter(nace_r2 == "TOTAL") |>
  closest_year(year_target) |>
  transmute(
    nuts_id = substr(geo, 1, 4),
    total_emp = values
  ) |>
  distinct()

# Manufacturing employment
mfg_emp <- emp |>
  filter(nace_r2 == "C") |>
  closest_year(year_target) |>
  transmute(
    nuts_id = substr(geo, 1, 4),
    manufacturing_emp = values
  ) |>
  distinct()

############################################################
# 6. HISTORICAL EMPLOYMENT (FOR DEINDUSTRIALIZATION)
############################################################

total_emp_base <- emp |>
  filter(nace_r2 == "TOTAL") |>
  closest_year(base_year) |>
  transmute(
    nuts_id = substr(geo, 1, 4),
    total_emp_base = values
  ) |>
  distinct()

mfg_emp_base <- emp |>
  filter(nace_r2 == "C") |>
  closest_year(base_year) |>
  transmute(
    nuts_id = substr(geo, 1, 4),
    manufacturing_emp_base = values
  ) |>
  distinct()

############################################################
# 7. MERGE ALL DATA
############################################################

regional_df <- nuts2_sf |>
  st_drop_geometry() |>
  left_join(gdp, by = "nuts_id") |>
  left_join(unemp, by = "nuts_id") |>
  left_join(migration, by = "nuts_id") |>
  left_join(total_emp, by = "nuts_id") |>
  left_join(mfg_emp, by = "nuts_id") |>
  left_join(total_emp_base, by = "nuts_id") |>
  left_join(mfg_emp_base, by = "nuts_id") |>
  mutate(
    manufacturing_share = if_else(
      !is.na(total_emp) & total_emp != 0,
      manufacturing_emp / total_emp,
      NA_real_
    ),
    manufacturing_share_base = if_else(
      !is.na(total_emp_base) & total_emp_base != 0,
      manufacturing_emp_base / total_emp_base,
      NA_real_
    ),
    manufacturing_change = manufacturing_share - manufacturing_share_base
  ) |>
  distinct()

############################################################
# 8. MISSING DATA REPORT
############################################################

missing_report <- regional_df |>
  summarise(across(everything(), ~ mean(is.na(.))))

print(missing_report)

############################################################
# 9. BUILD SPATIAL DATASET
############################################################

regional_sf <- nuts2_sf |>
  left_join(
    regional_df,
    by = c("nuts_id", "region_name", "country")
  )

############################################################
# 10. EXPORT
############################################################

write_csv(
  regional_df,
  "europe_nuts2_research_dataset.csv"
)

st_write(
  regional_sf,
  "europe_nuts2_research_dataset.gpkg",
  delete_dsn = TRUE,
  quiet = TRUE
)

############################################################
# 11. SUMMARY
############################################################

cat("Dataset successfully created\n")
cat("Regions: ", nrow(regional_df), "\n", sep = "")
cat("Countries: ", dplyr::n_distinct(regional_df$country), "\n", sep = "")
cat("Files written:\n")
cat(" - europe_nuts2_research_dataset.csv\n")
cat(" - europe_nuts2_research_dataset.gpkg\n")