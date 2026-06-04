# Exploitation and Exploration of Geospatial Data

## HEC Montréal — Geospatial Data Science Teaching Repository

This repository supports the course **Exploitation and Exploration of Geospatial Data** at HEC Montréal. It is designed as a teaching and research companion for students who want to understand how geographical data can be collected, structured, analyzed, mapped, and interpreted in the study of global transformations.

The central premise of the course is simple: many contemporary transformations are not only economic, political, technological, or environmental. They are also spatial. Supply chains, migration corridors, innovation systems, territorial inequalities, climate exposure, political regimes, and global value networks all have a geography. This repository provides reproducible materials for learning how to make that geography visible, analyzable, and empirically useful.

## Institutional Context

| Item | Description |
| --- | --- |
| Course title | Exploitation and Exploration of Geospatial Data |
| French title | Exploitation et exploration des données géospatiales |
| Institution | HEC Montréal |
| Subject | Methodology |
| Programs | Master of Science and PhD, depending on the course code |
| Course codes | METH 60018 / METH 60018A and METH 70001 / METH 70001A |
| Credits | 3 |
| Main orientation | Geographic information systems, spatial data analysis, global transformations, and organizational risk |

The course introduces geographic information systems and geospatial data analysis as methodological tools for understanding major global transformations. It emphasizes both structured and unstructured data, including administrative indicators, geocoded information, satellite imagery, drone imagery, and other forms of geosensing.

## Course Orientation

This repository is not a static collection of files. It is a methodological workspace. Students are expected to move between concepts, code, maps, and interpretation. The objective is to develop the ability to formulate a spatial research question, identify appropriate spatial units, assemble data from official and open sources, evaluate the limits of the data, and produce interpretable spatial outputs.

The course is particularly relevant for students in management, international business, economics, public policy, and data science who need to analyze how organizations are exposed to risks and opportunities across territories. The same logic applies to questions of trade, finance, supply chains, environmental exposure, innovation diffusion, political instability, migration, and regional development.

## Learning Objectives

| Dimension | Expected learning outcome |
| --- | --- |
| Spatial reasoning | Translate a substantive question into a spatial research design. |
| Data literacy | Understand spatial units, geometries, coordinate systems, attributes, and joins. |
| Reproducible workflow | Use R scripts to collect, clean, transform, and export spatial datasets. |
| GIS practice | Use QGIS to organize layers, design maps, and export cartographic outputs. |
| Empirical interpretation | Read maps critically and distinguish spatial description from causal inference. |
| Research communication | Document assumptions, data sources, limitations, and analytical choices. |

## Repository Structure

| Path | Role in the course |
| --- | --- |
| `data_geoeconomic_geopolitical_risks/` | Reproducible data module for constructing a European regional dataset on geoeconomic and geopolitical risk. |
| `data_geoeconomic_geopolitical_risks/code/build_europe_dataset.R` | R script that downloads Eurostat indicators, retrieves GISCO NUTS geometries, joins the data, and exports tabular and spatial files. |
| `cas_agence_developpement/` | Applied QGIS case containing source data, base-map layers, a QGIS template, exported maps, and a practical mapping guide. |
| `CITATION.cff` | Citation metadata for the repository and dataset. |
| `geospatial_data_science.Rproj` | RStudio project file for working with the repository in a reproducible local environment. |

## Main Teaching Modules

### 1. Geoeconomic and Geopolitical Regional Risks Dataset

This module shows how official statistical data can be combined with spatial geometries to build a research-ready dataset. The current workflow focuses on European NUTS-2 regions and uses regional indicators from Eurostat together with GISCO geometries. It is intended to help students understand the complete analytical chain: selecting spatial units, downloading indicators, cleaning variables, joining tabular and spatial data, checking missingness, and exporting files for analysis or cartography.

| Variable | Interpretation | Pedagogical use |
| --- | --- | --- |
| `nuts_id` | NUTS-2 regional identifier | Spatial key for joins and mapping. |
| `region_name` | Name of the region | Human-readable regional label. |
| `country` | Country code | National grouping variable. |
| `gdp_pps_eu27` | GDP per capita in purchasing power standards, with EU27 as reference | Indicator of regional prosperity. |
| `unemployment_rate` | Regional unemployment rate | Indicator of labour-market conditions. |
| `net_migration_rate` | Regional net migration rate | Indicator of demographic dynamics. |
| `manufacturing_emp` | Employment in manufacturing | Measure of industrial structure. |
| `total_emp` | Total employment | Denominator for sectoral employment shares. |
| `manufacturing_share` | Manufacturing employment as a share of total employment | Indicator of industrial specialization. |
| `manufacturing_change` | Change in manufacturing share relative to a base year | Proxy for industrial restructuring or deindustrialization. |

### 2. Applied QGIS Case: Agence de développement

This module is designed as a practical cartography exercise. It guides students through the organization of source data, the use of background layers, the management of a QGIS project template, and the export of maps. The purpose is to connect technical GIS operations with analytical communication: a map is not only a visualization, but also a structured argument about space.

## Reproducibility

The European regional dataset can be regenerated from the repository root with the following R command:

```r
source("data_geoeconomic_geopolitical_risks/code/build_europe_dataset.R")
```

The script uses the following R packages:

```r
install.packages(c("sf", "dplyr", "readr", "stringr", "eurostat", "giscoR", "janitor"))
```

When executed successfully, the script writes two files:

```text
europe_nuts2_research_dataset.csv
europe_nuts2_research_dataset.gpkg
```

The CSV file is suitable for tabular analysis. The GeoPackage file can be opened in QGIS or used directly in R for spatial analysis.

## Data Sources and Spatial Units

| Source | Role in the repository |
| --- | --- |
| Eurostat | Regional economic, demographic, labour-market, and employment indicators. |
| GISCO | NUTS geometries used to construct spatial layers. |
| QGIS | Desktop GIS environment used in the applied cartography case. |
| R | Reproducible programming environment used for data collection, transformation, and export. |

The use of NUTS-2 regions is pedagogically useful because it gives students an intermediate territorial scale: more precise than national aggregates, but still sufficiently harmonized for comparative regional analysis. This makes the dataset appropriate for studying development gaps, labour-market variation, industrial specialization, migration patterns, and other territorial dimensions of global transformation.

## Course Themes Reflected in the Repository

| Theme | How it appears in the materials |
| --- | --- |
| Nature of geographic data | Spatial units, attributes, geometries, administrative boundaries, and territorial scale. |
| Geographic information systems | QGIS projects, map layers, visual hierarchy, and export workflows. |
| Geocoding and georeferencing | Conceptual preparation for transforming locations, images, and textual data into spatial objects. |
| Structured geospatial data | Eurostat indicators, NUTS geometries, and reproducible spatial joins. |
| Unstructured geospatial data | Extension toward social media, patents, satellite imagery, drone imagery, and geosensing. |
| Global transformations | Political regimes, trade and finance, innovation, migration, climate exposure, supply chains, and territorial risk. |

## Suggested Use in Class

| Course activity | Repository use |
| --- | --- |
| Lecture preparation | Introduce spatial thinking, GIS concepts, and the logic of territorial data. |
| Lab session | Run the R workflow, inspect variables, and open the GeoPackage in QGIS. |
| Case discussion | Use the Agence de développement module to connect map design with analytical interpretation. |
| Student assignment | Ask students to replace, extend, or critique one indicator and document its implications. |
| Research project | Use the dataset as a starting point for exploratory spatial analysis or regional political economy research. |

## Methodological Position

The repository treats maps as empirical objects rather than illustrations. A map can clarify a pattern, but it can also hide uncertainty, exaggerate differences, or imply relationships that the data do not establish. Students should therefore document spatial units, temporal coverage, missing data, transformations, joins, and classification choices. This practice is central to responsible geospatial data science.

## Limitations

The materials are intended for teaching and exploratory research. Some datasets may require updates as official sources revise their classifications or release new years of data. The European regional workflow depends on Eurostat and GISCO availability, and the interpretation of spatial patterns should be made with attention to scale, measurement, missingness, and the difference between descriptive mapping and causal analysis.

## Citation

If you use this repository or the dataset in teaching, research, or derivative work, please cite it as follows:

Warin, T. (2025). *Geospatial Data Science: Geoeconomic and Geopolitical Regional Risks Dataset* (Version 1.0) [Data set]. GitHub. https://github.com/warint/geospatial_data_science

## References and Official Sources

European Commission. (n.d.). *NUTS—Nomenclature of territorial units for statistics*. Eurostat. https://ec.europa.eu/eurostat/web/nuts

European Commission. (n.d.). *Regional statistics database*. Eurostat. https://ec.europa.eu/eurostat/web/regions/database

European Commission. (n.d.). *Territorial units for statistics (NUTS)*. GISCO. https://ec.europa.eu/eurostat/web/gisco/geodata/statistical-units/territorial-units-statistics

HEC Montréal. (2026). *Exploitation and Exploration of Geospatial Data: METH 60018A*. HEC Montréal Course Portal. https://www.hec.ca/en/courses/meth-60018a-exploitation-and-exploration-geospatial-data

HEC Montréal. (2026). *Exploitation and Exploration of Geospatial Data: METH 70001A*. HEC Montréal Course Portal. https://www.hec.ca/en/courses/meth-70001a-exploitation-and-exploration-geospatial-data

Rodríguez-Pose, A. (2018). The revenge of the places that do not matter (and what to do about it). *Cambridge Journal of Regions, Economy and Society, 11*(1), 189–209. https://doi.org/10.1093/cjres/rsx024

## License

The repository citation metadata identifies the license as MIT.
