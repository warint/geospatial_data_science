# Exploitation and Exploration of Geospatial Data

## HEC Montréal course repository

This repository supports the course **Exploitation and Exploration of Geospatial Data** at HEC Montréal. The course begins from a methodological proposition that is simple but demanding: major economic, political, technological, and social transformations are not only temporal processes; they are also spatial processes. They unfold through territories, borders, cities, ports, firms, corridors, institutions, and infrastructures. Geospatial data make those structures visible, comparable, and analytically tractable.

The repository provides teaching material for students who need to move from a substantive question to a spatial research design, assemble and document data, use geographic information systems, produce interpretable maps, and communicate evidence through a disciplined analytical argument. It is intended for students in management, economics, international business, public policy, development, and data science.

The repository is organized around three complementary teaching modules. The first is a case-method module on submarine cables and development, **Eritrea Digital Gateway 2030**. The second is an applied QGIS module on **Agences de développement économique (ADEs)**. The third is a reproducible data-science module, **Geoeconomic and Geopolitical Regional Risks Dataset**, focused on European regional indicators and spatial analysis.

---

## Repository modules

| Path | Module | Main use in the course |
| --- | --- | --- |
| `eritrea_digital_gateway_2030/` | **Eritrea Digital Gateway 2030** | Case-method discussion on Internet access, submarine cables, digital sovereignty, infrastructure governance, and economic development. |
| `cas_agence_developpement/` | **ADE case** | QGIS exercise on mapping economic development agencies, joining tabular data to spatial layers, using a map template, and producing a professional export. |
| `data_geoeconomic_geopolitical_risks/` | **Geoeconomic and Geopolitical Regional Risks Dataset** | Reproducible R pipeline for building a NUTS-2 European regional dataset and exploring spatial patterns in development, employment, migration, and industrial structure. |

These modules are not independent fragments. They represent a progression. The ADE case introduces the mechanics of QGIS and cartographic communication. The geoeconomic and geopolitical risks module introduces reproducibility, data construction, and spatial indicators. The Eritrea case asks students to use geospatial evidence to defend a strategic recommendation under political uncertainty.

---

## Case module: Eritrea Digital Gateway 2030

**Eritrea Digital Gateway 2030: Connecting a Country after Isolation** is a case study about the economic and strategic consequences of digital exclusion. The case asks what happens when a country is geographically close to the main arteries of the global Internet but remains institutionally, technically, and commercially disconnected from them.

At the center of the case is Idriss Gaye, director of strategic projects at ORIZON-Telecom. In July 2025, he is asked to prepare a strategic recommendation for connecting Eritrea to the global Internet after a long period of political isolation. The decision is not framed as a purely technical problem. It is a governance problem, a development problem, and a geospatial decision problem.

Students must evaluate three connectivity scenarios:

1. a terrestrial fibre connection through Sudan;
2. a satellite-based interim architecture;
3. a submarine cable landing and domestic fibre backbone linked to regional cable infrastructure.

The larger question is whether access to the Internet, and therefore access to knowledge, markets, platforms, education, finance, and administrative capacity, should be treated as a peripheral infrastructure issue or as a foundational condition for economic development.

### Eritrea teaching package

| File | Audience | Purpose |
| --- | --- | --- |
| `Eritrea_Digital_Gateway_2030_Case_Study.docx` | Students | Case narrative, decision context, scenarios, exhibits, and discussion questions. |
| `Eritrea_Digital_Gateway_2030_Teaching_Note.docx` | Instructors | Teaching plan, learning objectives, class flow, expected arguments, QGIS use, and assessment guidance. |
| `Eritrea_Digital_Gateway_2030_QGIS_Student_Data.zip` | Students | QGIS-ready geospatial layers, seed indicators, metadata, and assignment materials. |

The teaching note should not be placed in a public folder accessible to students before the case discussion. If this repository is public, store the teaching note in a private repository, a private release, or a restricted learning-management-system folder.

---

## ADE case: mapping economic development agencies

The folder `cas_agence_developpement/` contains an applied QGIS case on **Agences de développement économique (ADEs)**. This module is designed as a practical entry point into geospatial data work. Students begin with a tabular dataset, load a spatial background layer, apply a QGIS layout template, and produce a clean cartographic export.

The case is especially useful early in the course because it forces students to confront several basic but important operations: inspecting an attribute table, understanding spatial identifiers, joining data to administrative boundaries, choosing a visual encoding, checking projection and scale, building a layout, and exporting a map that can be read by a policy or managerial audience.

The folder is organized as follows:

```text
cas_agence_developpement/
├── 01_Base_de_données/
│   └── A.D.E_CAN_Base_De_Données.xlsx
├── 02_Fond_de_carte/
│   └── Layer_Fond_map_AN_shp/
│       ├── Canada_Provinces.shp
│       ├── Canada_Provinces.dbf
│       ├── Canada_Provinces.shx
│       ├── Canada_Provinces.prj
│       └── Natural Earth administrative boundary files
├── 03_Template_QGIS/
│   └── ADE_cartographies_Template.qpt
├── 05_Exports_cartes/
│   └── Exemple_Carte_ADE_federales/
│       └── Carte_ADEs_Fédéral.pdf
└── Guide_Cartes_ADEs_QGIS.pdf
```

The recommended student task is to reproduce the ADE map from the guide, then modify it by changing the classification, the symbology, the title, and the interpretation. The objective is not only to produce a map but to learn how a small design decision can change the message conveyed by a spatial visualization.

---

## Data module: Geoeconomic and Geopolitical Regional Risks Dataset

The folder `data_geoeconomic_geopolitical_risks/` contains a reproducible R pipeline for constructing a regional dataset for Europe. The module uses NUTS-2 spatial units and combines regional geometries with official statistical indicators. It is designed for teaching spatial data construction, regional economic analysis, exploratory mapping, and the distinction between a map as visualization and a map as evidence.

The dataset includes regional indicators such as GDP per capita in purchasing power standards, unemployment, net migration, manufacturing employment, total employment, manufacturing share, and change in manufacturing share. These variables allow students to explore spatial patterns of prosperity, labor-market pressure, demographic change, and industrial restructuring.

The folder is organized as follows:

```text
data_geoeconomic_geopolitical_risks/
├── README.md
└── code/
    └── build_europe_dataset.R
```

To regenerate the dataset from the repository root, run:

```r
source("data_geoeconomic_geopolitical_risks/code/build_europe_dataset.R")
```

The script uses `sf`, `dplyr`, `readr`, `stringr`, `eurostat`, `giscoR`, and `janitor`. It downloads NUTS-2 geometries and Eurostat indicators, merges them into a regional dataset, and writes two outputs: `europe_nuts2_research_dataset.csv` and `europe_nuts2_research_dataset.gpkg`. The GeoPackage can be opened directly in QGIS; the CSV can be inspected in R, Python, or a spreadsheet application.

---

## Suggested repository structure

The following structure is recommended for the GitHub version of the course repository after adding the Eritrea case package.

```text
geospatial_data_science/
├── README.md
├── eritrea_digital_gateway_2030/
│   ├── README.md
│   ├── case/
│   │   └── Eritrea_Digital_Gateway_2030_Case_Study.docx
│   ├── qgis_student_data/
│   │   └── Eritrea_Digital_Gateway_2030_QGIS_Student_Data.zip
│   ├── figures/
│   └── instructor_private/
│       └── Eritrea_Digital_Gateway_2030_Teaching_Note.docx
├── cas_agence_developpement/
│   ├── 01_Base_de_données/
│   ├── 02_Fond_de_carte/
│   ├── 03_Template_QGIS/
│   ├── 05_Exports_cartes/
│   └── Guide_Cartes_ADEs_QGIS.pdf
├── data_geoeconomic_geopolitical_risks/
│   ├── README.md
│   └── code/
├── CITATION.cff
└── geospatial_data_science.Rproj
```

A simpler public version can place the student case and the QGIS zip at the root of the repository. The instructor note should still remain outside the public student path unless the course design intentionally makes it available after the session.

---

## QGIS data package for the Eritrea case

The QGIS package is designed for classroom use. It gives students enough spatial material to compare scenarios without treating the exercise as an engineering study. The dataset includes a GeoPackage, GeoJSON exports, tabular decision files, metadata, a QGIS assignment template, and a preview map.

```text
Eritrea_Digital_Gateway_2030_QGIS_Student_Data/
├── README.md
├── data/
│   ├── eritrea_digital_gateway_2030.gpkg
│   ├── governance_actors.csv
│   ├── internet_access_seed_indicators.csv
│   ├── scenario_scorecard_seed.csv
│   └── geojson/
│       ├── countries_context.geojson
│       ├── eritrea_cities.geojson
│       ├── regional_nodes.geojson
│       ├── scenario1_terrestrial_route.geojson
│       ├── scenario2_satellite_sites.geojson
│       ├── scenario2_satellite_buffers_50km.geojson
│       ├── scenario3_submarine_branches.geojson
│       ├── scenario3_domestic_backbone.geojson
│       ├── red_sea_cable_corridors_schematic.geojson
│       ├── risk_points_synthetic.geojson
│       └── risk_zones_synthetic.geojson
├── docs/
│   ├── data_dictionary.csv
│   ├── metadata_sources.md
│   └── qgis_assignment_template.md
├── maps/
│   └── preview_scenario_layers.png
├── qgis/
│   └── layer_order_suggestion.md
└── scripts/
    └── fetch_worldbank_internet_users.py
```

The most convenient entry point for students is the GeoPackage file, `eritrea_digital_gateway_2030.gpkg`. The GeoJSON layers are included for transparency, inspection, and reuse in other GIS or web-mapping tools.

---

## Quick start for students

### Eritrea Digital Gateway 2030

Download `Eritrea_Digital_Gateway_2030_QGIS_Student_Data.zip` and unzip it locally. Open QGIS, create a new project, and add `data/eritrea_digital_gateway_2030.gpkg` as a vector data source. Load the scenario layers, the city layer, the regional-node layer, and the risk layers. Use `qgis/layer_order_suggestion.md` to organize the map visually.

Students should prepare at least three maps before the case discussion. The first map should diagnose Eritrea’s position in the Red Sea connectivity corridor. The second should compare the three scenarios in terms of geography, coverage, and exposure to risk. The third should support the student’s final recommendation. The maps are not expected to decide the case automatically. Their purpose is to discipline the discussion by showing what each option makes visible and what each option leaves unresolved.

### ADE case

Open `Guide_Cartes_ADEs_QGIS.pdf` and follow the sequence in the guide. Load the spreadsheet from `01_Base_de_données/`, the map background from `02_Fond_de_carte/`, and the layout template from `03_Template_QGIS/`. Use the example export in `05_Exports_cartes/` as a reference, not as a final answer.

Students should verify that the join between the ADE data and the geographic layer is correct, inspect unmatched records, and document every cartographic choice. The final map should be accompanied by a short interpretation explaining what the geography of the ADE data suggests and what cannot be concluded from the map alone.

### Geoeconomic and geopolitical risks module

Open R from the repository root and run the build script. Then load `europe_nuts2_research_dataset.gpkg` in QGIS. Students should begin with one descriptive map, one bivariate or comparative interpretation, and one short paragraph explaining how the choice of spatial unit affects the interpretation of regional inequality.

---

## Suggested student assignments

### Eritrea strategic memorandum

Students write a short strategic memorandum addressed to Idriss Gaye before the Nairobi technical committee. The memorandum should recommend one connectivity strategy, justify the recommendation with QGIS evidence, and identify the principal governance safeguards required for implementation.

A strong submission should distinguish short-term connectivity from long-term structural transformation. It should also recognize that the cheapest option may not be the most resilient option, that the fastest option may not create durable sovereignty, and that a high-capacity cable is not sufficient unless the domestic regulatory and institutional architecture can sustain it.

### ADE cartographic note

Students submit one map and a one-page cartographic note. The note should explain the data source, the spatial layer, the join key, the chosen classification or symbology, the main pattern visible on the map, and one limitation. The aim is to develop cartographic discipline before moving to more complex strategic cases.

### Regional risks reproducibility note

Students reproduce the European regional dataset and submit a short reproducibility note. The note should report the packages used, the year of analysis, the indicators retrieved, the number of regions in the final dataset, and one map-based interpretation of a regional economic pattern.

---

## Analytical frame

The repository can be taught through four linked concepts.

First, **connectivity as development infrastructure**. Broadband access is not only a consumer service. It affects education, firms, public administration, financial inclusion, labor-market matching, and the circulation of knowledge.

Second, **infrastructure as geography**. Submarine cables, landing stations, agencies, firms, and regional economic structures are all spatially organized. Their location matters because proximity, distance, borders, and corridors change the distribution of opportunity and risk.

Third, **digital sovereignty as governance capacity**. Sovereignty is not simply ownership of an asset. It also depends on regulation, cybersecurity, maintenance, procurement, competition policy, data governance, and the ability to negotiate with external partners.

Fourth, **maps as decision instruments**. QGIS is not used only to make decorative maps. It is used to compare routes, coverage, proximity, risk, institutional trade-offs, administrative geographies, and regional disparities. The map is a decision instrument because it clarifies how a policy or infrastructure choice redistributes opportunity and vulnerability across space.

---

## Data status and limitations

The Eritrea data package is intended for teaching and exploratory analysis. It is not a nautical chart, an engineering design file, a security assessment, or an investment prospectus. Some layers are schematic, simplified, or synthetic. The risk layers in the student package are synthetic teaching layers and should not be interpreted as operational conflict data.

The ADE folder is an instructional QGIS package. Students should treat the example map as a template for method and presentation, not as a definitive empirical statement without checking the data dictionary, join quality, and source documentation.

The geoeconomic and geopolitical risks module is a reproducible teaching dataset. It uses official statistical sources, but students must still inspect missing values, temporal coverage, country comparability, and the implications of using NUTS-2 regions as the unit of analysis.

Instructors who replace synthetic or simplified layers with official or third-party data must verify the license and redistribution conditions of each source before committing those files to GitHub. This is particularly important for datasets such as ACLED, commercial telecommunications datasets, proprietary cable maps, and firm-level databases.

---

## Recommended classroom sequence

The repository can support either a single case session or a multi-session sequence.

| Session | Focus | Activity |
| --- | --- | --- |
| 1 | QGIS foundations through the ADE case | Load tabular and spatial data, perform a join, apply a layout template, and export a readable map. |
| 2 | Reproducible spatial data through the regional risks module | Run the R pipeline, inspect the generated GeoPackage, and map regional economic indicators. |
| 3 | Strategic geospatial decision-making through the Eritrea case | Use QGIS evidence to compare connectivity scenarios and defend a recommendation. |

For a 150- to 180-minute Eritrea case session, the following sequence is recommended.

| Phase | Time | Activity |
| --- | ---: | --- |
| Opening | 20–30 min | Establish the economic development problem: what does digital isolation do to firms, public services, and knowledge access? |
| Map workshop | 30–40 min | Use QGIS to inspect the three connectivity scenarios and identify what the spatial evidence suggests. |
| Scenario debate | 40–50 min | Divide students into groups representing the terrestrial, satellite, submarine, and governance-risk perspectives. |
| Decision meeting | 30–40 min | Simulate the Nairobi technical committee and require each group to defend a recommendation. |
| Debrief | 15–20 min | Separate the technical recommendation from the governance conditions required to make it viable. |

---

## Connection with the course

The modules fit the course because they require students to combine spatial data, economic reasoning, managerial judgment, and critical interpretation. They also illustrate the broader course theme that global transformations can be studied through spatial evidence: the geography of infrastructures, the uneven diffusion of technology and knowledge, the exposure of organizations to political risk, the distribution of agencies and institutions, and the spatial structure of regional economic change.

The modules can be used after sessions on vector data, coordinate reference systems, spatial joins, buffers, routes, choropleth maps, layout design, data pipelines, and critical cartography. They can also serve as bridges toward more advanced work on infrastructure resilience, international business risk, regional development, and the geography of digital platforms.

---

## Citation

If you use or adapt this repository, cite the repository and the relevant module materials.

Warin, T. (2025). *Geospatial Data Science: Course repository for Exploitation and Exploration of Geospatial Data* [Teaching repository]. GitHub. https://github.com/warint/geospatial_data_science

Warin, T., & Marcon, B. (2025). *Eritrea Digital Gateway 2030: Connecting a country after isolation* [Case study and QGIS teaching package]. HEC Montréal, course repository for *Exploitation and Exploration of Geospatial Data*. GitHub. https://github.com/warint/geospatial_data_science

Warin, T. (2025). *Agences de développement économique: QGIS teaching case* [QGIS instructional package]. HEC Montréal, course repository for *Exploitation and Exploration of Geospatial Data*. GitHub. https://github.com/warint/geospatial_data_science

Warin, T. (2025). *Geoeconomic and Geopolitical Regional Risks Dataset* [R pipeline and QGIS-ready dataset]. HEC Montréal, course repository for *Exploitation and Exploration of Geospatial Data*. GitHub. https://github.com/warint/geospatial_data_science

---

## Selected references

African Union. (2020). *The digital transformation strategy for Africa (2020–2030)*. African Union Commission. https://au.int/en/documents/20200518/digital-transformation-strategy-africa-2020-2030

Cariolle, J. (2019). *Telecommunication submarine-cable deployment and the digital divide in Sub-Saharan Africa* (FERDI Working Paper P241). Fondation pour les études et recherches sur le développement international. https://ferdi.fr/dl/df-9h5z9RWRNm4adFraG5Zd9YpS/ferdi-p241-telecommunication-submarine-cable-deployment-and.pdf

European Commission. (n.d.). *NUTS—Nomenclature of territorial units for statistics*. Eurostat. https://ec.europa.eu/eurostat/web/nuts

Eurostat. (n.d.). *Regional statistics by NUTS classification*. European Commission. https://ec.europa.eu/eurostat/web/regions/database

HEC Montréal. (2026). *METH 60018A—Exploitation and Exploration of Geospatial Data*. HEC Montréal Course Portal. https://www.hec.ca/en/courses/meth-60018a-exploitation-and-exploration-geospatial-data

HEC Montréal. (2026). *METH 70001A—Exploitation and Exploration of Geospatial Data*. HEC Montréal Course Portal. https://www.hec.ca/en/courses/meth-70001a-exploitation-and-exploration-geospatial-data

Hjort, J., & Poulsen, J. (2019). The arrival of fast Internet and employment in Africa. *American Economic Review, 109*(3), 1032–1079. https://doi.org/10.1257/aer.20161385

International Cable Protection Committee. (2024). *Government best practices for protecting and promoting resilience of submarine telecommunications cables*. https://www.iscpc.org/publications/icpc-best-practices/

Minges, M. (2015). *Exploring the relationship between broadband and economic growth*. World Bank. https://documents.worldbank.org/curated/en/178701467988875888/pdf/102955-WP-Box394845B-PUBLIC-WDR16-BP-Exploring-the-Relationship-between-Broadband-and-Economic-Growth-Minges.pdf

Natural Earth. (n.d.). *Natural Earth: Free vector and raster map data*. https://www.naturalearthdata.com/

QGIS Development Team. (n.d.). *QGIS Geographic Information System*. Open Source Geospatial Foundation Project. https://qgis.org

Qiang, C. Z.-W., Rossotto, C. M., & Kimura, K. (2009). Economic impacts of broadband. In World Bank, *Information and communications for development 2009: Extending reach and increasing impact* (pp. 35–50). World Bank. https://documents.worldbank.org/curated/en/645821468337815208/pdf/487910PUB0EPI1101Official0Use0Only1.pdf

Raymond, M., & DeNardis, L. (2015). Multistakeholderism: Anatomy of an inchoate global institution. *International Theory, 7*(3), 572–616. https://doi.org/10.1017/S1752971915000081

Rodríguez-Pose, A. (2018). The revenge of the places that do not matter. *Cambridge Journal of Regions, Economy and Society, 11*(1), 189–209. https://doi.org/10.1093/cjres/rsx024

Starosielski, N. (2015). *The undersea network*. Duke University Press. https://www.dukeupress.edu/the-undersea-network

TeleGeography. (n.d.). *Submarine cable map*. https://www.submarinecablemap.com/

---

## License

Unless otherwise specified in a dedicated `LICENSE` file, the code and teaching materials in this repository should be treated as course materials requiring attribution. Data redistributed from third-party sources remain subject to the licenses and terms of their original providers.
