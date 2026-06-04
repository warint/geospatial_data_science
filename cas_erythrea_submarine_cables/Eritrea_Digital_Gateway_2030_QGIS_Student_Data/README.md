# Eritrea Digital Gateway 2030 - QGIS Student Data Kit

This folder contains a compact geospatial data package for the case **Eritrea Digital Gateway 2030: A Country at the Edge of the Knowledge Network**. It is designed for classroom use in QGIS. The core file is `data/eritrea_digital_gateway_2030.gpkg`, a GeoPackage with country polygons, city nodes, scenario routes, satellite buffers, submarine-cable branch alternatives, and synthetic risk zones.

The package deliberately separates public contextual data from classroom scenario data. Country boundaries come from Natural Earth low-resolution data. The routes, cable corridors, risk zones, satellite buffers, governance tables, and scorecards are pedagogical constructs. They are not engineering alignments, official cable coordinates, investment advice, or nautical data.

## Quick start in QGIS

Open QGIS and drag `data/eritrea_digital_gateway_2030.gpkg` into the Layers panel. Select all layers. Set the project CRS to EPSG:4326 or, for distance calculations, use a suitable projected CRS such as EPSG:3857 or UTM Zone 37N. Students should start with the layers `countries_context`, `eritrea_cities`, `regional_nodes`, and then add each scenario layer separately.

## Suggested student tasks

1. Map the three scenarios and compare the spatial exposure of each route.
2. Use `risk_zones_synthetic` to evaluate the terrestrial Sudan option.
3. Use the 50 km LEO buffers to estimate which Eritrean nodes receive first-stage coverage.
4. Compare the Massawa and Assab landing alternatives for the submarine-cable scenario.
5. Build a weighted decision matrix using `scenario_scorecard_seed.csv`.
6. Write a one-page recommendation memo for the Nairobi technical committee.

## Data status

The GeoPackage was generated for classroom discussion. It is intentionally small enough to store in a GitHub repository and to distribute to students without separate registration. If instructors want to replace the synthetic risk zones with real conflict events, they can use ACLED or another licensed conflict-event dataset, subject to the relevant data-use agreement.
