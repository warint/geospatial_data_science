# Global Regional Risk Dataset

## Global Regional Risk Dataset — Data Dictionary

| Variable               | Description                                                                                                                   | Level              | Source                                  | Year   | Notes                                                                              |
| ---------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------------------ | --------------------------------------- | ------ | ---------------------------------------------------------------------------------- |
| `region_id`            | Unique identifier for the regional unit (state or province). Based on ISO-3166-2 codes from Natural Earth Admin-1 boundaries. | Region             | Natural Earth Admin-1 dataset           | Static | Used as the primary regional key for spatial joins.                                |
| `iso3`                 | ISO-3 country code corresponding to the sovereign state containing the region.                                                | Country            | Natural Earth / ISO 3166 standard       | Static | Used to merge regional polygons with national statistical indicators.              |
| `country`              | Country name associated with the regional unit.                                                                               | Country            | Natural Earth                           | Static | Human-readable country label.                                                      |
| `region_name`          | Name of the first-level administrative unit (state, province, region).                                                        | Region             | Natural Earth                           | Static | Geographic administrative unit name.                                               |
| `gdp_pc`               | Gross domestic product per capita (current USD).                                                                              | Country            | World Bank World Development Indicators | 2022   | Proxy for national economic development level.                                     |
| `unemployment`         | Total unemployment rate (% of labour force).                                                                                  | Country            | World Bank World Development Indicators | 2022   | National labour market indicator applied uniformly to regions of the same country. |
| `gini`                 | Gini coefficient measuring income inequality.                                                                                 | Country            | World Bank World Development Indicators | 2022   | Values range from 0 (perfect equality) to 100 (perfect inequality).                |
| `education_index`      | Secondary school enrollment rate (% gross).                                                                                   | Country            | World Bank World Development Indicators | 2022   | Used as a proxy for educational attainment or human capital.                       |
| `manufacturing_share`  | Share of employment in manufacturing (%).                                                                                     | Region (synthetic) | Simulated variable                      | 2022   | Placeholder indicator representing regional industrial structure.                  |
| `manufacturing_change` | Change in manufacturing employment share over time.                                                                           | Region (synthetic) | Simulated variable                      | 2022   | Proxy for regional deindustrialization.                                            |
| `migration_rate`       | Net migration rate per region.                                                                                                | Region (synthetic) | Simulated variable                      | 2022   | Placeholder for demographic pressure or migration flows.                           |
| `populist_vote_share`  | Share of votes received by populist parties in regional elections (%).                                                        | Region (synthetic) | Simulated variable                      | 2022   | Placeholder variable for spatial political outcomes.                               |



## Dataset Structure

| Attribute         | Value                                                          |
| ----------------- | -------------------------------------------------------------- |
| Spatial units     | Global first-level administrative regions (states / provinces) |
| Number of regions | ~4000                                                          |
| Spatial source    | Natural Earth Admin-1 polygons                                 |
| Temporal coverage | 2022                                                           |
| Format            | CSV table and GeoPackage (QGIS-ready)                          |



## Methodological Notes

The dataset combines **national indicators with regional spatial units**. National indicators are replicated across regions within each country to allow spatial mapping and exploratory analysis. This approach is common in early-stage geospatial analysis when harmonized regional statistics are unavailable for all countries.

Several variables (`manufacturing_share`, `manufacturing_change`, `migration_rate`, `populist_vote_share`) are **synthetic placeholders** intended to represent typical regional patterns. They should be replaced by real regional datasets for empirical analysis.

Examples of suitable replacements include:

* Eurostat regional statistics (NUTS regions)
* OECD regional database
* MIT Election Data and Science Lab election datasets
* EU-NED regional election database



## References

Natural Earth. (2024). *Admin-1 states and provinces dataset*.
World Bank. (2024). *World Development Indicators*.
Rodríguez-Pose, A. (2018). The revenge of the places that don’t matter. *Cambridge Journal of Regions, Economy and Society*, 11(1), 189–209.
