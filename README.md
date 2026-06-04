# Exploitation and Exploration of Geospatial Data

## HEC Montréal course repository

This repository supports the course **Exploitation and Exploration of Geospatial Data** at HEC Montréal. The course is built around a simple methodological proposition: many economic, political, technological, and social transformations are also spatial transformations. They unfold across territories, corridors, borders, ports, cities, infrastructures, and networks. Geospatial data make those structures visible and analytically tractable.

The repository provides teaching material for students who need to move from a substantive question to a spatial research design, assemble relevant data, work with geographic information systems, and communicate evidence through maps. It is intended for students in management, economics, international business, public policy, development, and data science.

The current case module is **Eritrea Digital Gateway 2030**, a case-method exercise on submarine cables, Internet access, digital sovereignty, and economic development.

---

## Case module: Eritrea Digital Gateway 2030

**Eritrea Digital Gateway 2030: Connecting a Country after Isolation** is a case study about the economic and strategic consequences of digital exclusion. The case asks what happens when a country is geographically close to the main arteries of the global Internet but remains institutionally, technically, and commercially disconnected from them.

At the center of the case is Idriss Gaye, director of strategic projects at ORIZON-Telecom. In July 2025, he is asked to prepare a strategic recommendation for connecting Eritrea to the global Internet after a long period of political isolation. The decision is not framed as a purely technical problem. It is a governance problem, a development problem, and a geospatial decision problem.

Students must evaluate three connectivity scenarios:

1. a terrestrial fibre connection through Sudan;
2. a satellite-based interim architecture;
3. a submarine cable landing and domestic fibre backbone linked to regional cable infrastructure.

The larger question is whether access to the Internet, and therefore access to knowledge, markets, platforms, education, finance, and administrative capacity, should be treated as a peripheral infrastructure issue or as a foundational condition for economic development.

---

## Learning objectives

By the end of the case, students should be able to explain why submarine cables and landing stations are critical infrastructures in the contemporary economy; compare alternative models of digital infrastructure governance; use QGIS to inspect the spatial implications of competing connectivity scenarios; connect map-based evidence with strategic decision-making; and formulate a defensible recommendation under conditions of uncertainty, institutional fragility, and geopolitical rivalry.

The case is designed for a case-method classroom discussion combined with a QGIS laboratory. It requires students to read the narrative, interpret geospatial layers, compare strategic options, and defend a recommendation before a simulated technical committee.

---

## Teaching package

The case package contains three main components.

| File | Audience | Purpose |
| --- | --- | --- |
| `Eritrea_Digital_Gateway_2030_Case_Study.docx` | Students | Case narrative, decision context, scenarios, exhibits, and discussion questions. |
| `Eritrea_Digital_Gateway_2030_Teaching_Note.docx` | Instructors | Teaching plan, learning objectives, class flow, expected arguments, QGIS use, and assessment guidance. |
| `Eritrea_Digital_Gateway_2030_QGIS_Student_Data.zip` | Students | QGIS-ready geospatial layers, seed indicators, metadata, and assignment materials. |

The teaching note should not be placed in a public folder accessible to students before the case discussion. If this repository is public, store the teaching note in a private repository, a private release, or a restricted learning-management-system folder.

---

## Suggested repository structure

The following structure is recommended for the GitHub version of the course repository.

```text
geospatial_data_science/
├── README.md
├── case_studies/
│   └── eritrea_digital_gateway_2030/
│       ├── README.md
│       ├── Eritrea_Digital_Gateway_2030_Case_Study.docx
│       ├── instructor_private/
│       │   └── Eritrea_Digital_Gateway_2030_Teaching_Note.docx
│       └── figures/
├── qgis_data/
│   └── eritrea_digital_gateway_2030/
│       └── Eritrea_Digital_Gateway_2030_QGIS_Student_Data.zip
├── data_geoeconomic_geopolitical_risks/
├── cas_agence_developpement/
├── CITATION.cff
└── geospatial_data_science.Rproj
```

A simpler public version can place the student case and the QGIS zip at the root of the repository. The instructor note should still remain outside the public student path unless the course design intentionally makes it available after the session.

---

## QGIS data package

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

Download `Eritrea_Digital_Gateway_2030_QGIS_Student_Data.zip` and unzip it locally. Open QGIS, create a new project, and add `data/eritrea_digital_gateway_2030.gpkg` as a vector data source. Load the scenario layers, the city layer, the regional-node layer, and the risk layers. Use `qgis/layer_order_suggestion.md` to organize the map visually.

Students should prepare at least three maps before the case discussion. The first map should diagnose Eritrea’s position in the Red Sea connectivity corridor. The second should compare the three scenarios in terms of geography, coverage, and exposure to risk. The third should support the student’s final recommendation. The maps are not expected to decide the case automatically. Their purpose is to discipline the discussion by showing what each option makes visible and what each option leaves unresolved.

---

## Suggested student assignment

Students are asked to write a short strategic memorandum addressed to Idriss Gaye before the Nairobi technical committee. The memorandum should recommend one connectivity strategy, justify the recommendation with QGIS evidence, and identify the principal governance safeguards required for implementation.

A strong submission should distinguish short-term connectivity from long-term structural transformation. It should also recognize that the cheapest option may not be the most resilient option, that the fastest option may not create durable sovereignty, and that a high-capacity cable is not sufficient unless the domestic regulatory and institutional architecture can sustain it.

---

## Analytical frame

The case can be taught through four linked concepts.

First, **connectivity as development infrastructure**. Broadband access is not only a consumer service. It affects education, firms, public administration, financial inclusion, labor-market matching, and the circulation of knowledge.

Second, **submarine cables as strategic infrastructure**. Submarine cables and landing stations are physical assets through which the global Internet is materially organized. Their geography is therefore a matter of power, dependence, vulnerability, and opportunity.

Third, **digital sovereignty as governance capacity**. Sovereignty is not simply ownership of an asset. It also depends on regulation, cybersecurity, maintenance, procurement, competition policy, data governance, and the ability to negotiate with external partners.

Fourth, **maps as decision instruments**. In this case, QGIS is not used to make decorative maps. It is used to compare routes, coverage, proximity, risk, and institutional trade-offs. The map is a decision instrument because it clarifies how an infrastructure choice redistributes opportunity and vulnerability across space.

---

## Data status and limitations

The data package is intended for teaching and exploratory analysis. It is not a nautical chart, an engineering design file, a security assessment, or an investment prospectus. Some layers are schematic, simplified, or synthetic. The risk layers in the student package are synthetic teaching layers and should not be interpreted as operational conflict data.

Instructors who replace the synthetic layers with official or third-party data must verify the license and redistribution conditions of each source before committing those files to GitHub. This is particularly important for datasets such as ACLED, commercial telecommunications datasets, proprietary cable maps, and firm-level databases.

The case narrative is a pedagogical simulation. It is designed to represent realistic strategic tensions in digital infrastructure development, but the fictional organizations, negotiations, costs, and governance sequence should not be cited as factual evidence about Eritrea, ORIZON-Telecom, or any real infrastructure project.

---

## Recommended classroom sequence

The case can be taught in a 150- to 180-minute session.

| Phase | Time | Activity |
| --- | ---: | --- |
| Opening | 20–30 min | Establish the economic development problem: what does digital isolation do to firms, public services, and knowledge access? |
| Map workshop | 30–40 min | Use QGIS to inspect the three connectivity scenarios and identify what the spatial evidence suggests. |
| Scenario debate | 40–50 min | Divide students into groups representing the terrestrial, satellite, submarine, and governance-risk perspectives. |
| Decision meeting | 30–40 min | Simulate the Nairobi technical committee and require each group to defend a recommendation. |
| Debrief | 15–20 min | Separate the technical recommendation from the governance conditions required to make it viable. |

---

## Connection with the course

This module fits the course because it requires students to combine spatial data, geopolitical reasoning, development economics, and managerial decision-making. The case also illustrates the broader course theme that global transformations can be studied through spatial evidence: the geography of infrastructures, the uneven diffusion of technology and knowledge, the exposure of organizations to political risk, and the use of GIS to support strategic decisions.

The case can be used after sessions on vector data, coordinate reference systems, spatial joins, buffers, routes, choropleth maps, and critical cartography. It can also serve as a bridge toward more advanced modules on infrastructure resilience, international business risk, or the geography of digital platforms.

---

## Citation

If you use this case or adapt the QGIS package, cite the repository and the case materials as follows.

Warin, T., & Marcon, B. (2025). *Eritrea Digital Gateway 2030: Connecting a Country after Isolation* [Case study and QGIS teaching package]. HEC Montréal, course repository for *Exploitation and Exploration of Geospatial Data*. GitHub. https://github.com/warint/geospatial_data_science

Warin, T. (2025). *Geospatial Data Science: Course repository for Exploitation and Exploration of Geospatial Data* [Teaching repository]. GitHub. https://github.com/warint/geospatial_data_science

---

## Selected references

African Union. (2020). *The digital transformation strategy for Africa (2020–2030)*. African Union Commission. https://au.int/en/documents/20200518/digital-transformation-strategy-africa-2020-2030

Cariolle, J. (2019). *Telecommunication submarine-cable deployment and the digital divide in Sub-Saharan Africa* (FERDI Working Paper P241). Fondation pour les études et recherches sur le développement international. https://ferdi.fr/dl/df-9h5z9RWRNm4adFraG5Zd9YpS/ferdi-p241-telecommunication-submarine-cable-deployment-and.pdf

HEC Montréal. (2026). *METH 60018A — Exploitation and Exploration of Geospatial Data*. HEC Montréal Course Portal. https://www.hec.ca/en/courses/meth-60018a-exploitation-and-exploration-geospatial-data

HEC Montréal. (2026). *METH 70001A — Exploitation and Exploration of Geospatial Data*. HEC Montréal Course Portal. https://www.hec.ca/en/courses/meth-70001a-exploitation-and-exploration-geospatial-data

Hjort, J., & Poulsen, J. (2019). The arrival of fast Internet and employment in Africa. *American Economic Review, 109*(3), 1032–1079. https://doi.org/10.1257/aer.20161385

International Cable Protection Committee. (2024). *Government best practices for protecting and promoting resilience of submarine telecommunications cables*. https://www.iscpc.org/publications/icpc-best-practices/

Minges, M. (2015). *Exploring the relationship between broadband and economic growth*. World Bank. https://documents.worldbank.org/curated/en/178701467988875888/pdf/102955-WP-Box394845B-PUBLIC-WDR16-BP-Exploring-the-Relationship-between-Broadband-and-Economic-Growth-Minges.pdf

Qiang, C. Z.-W., Rossotto, C. M., & Kimura, K. (2009). Economic impacts of broadband. In World Bank, *Information and communications for development 2009: Extending reach and increasing impact* (pp. 35–50). World Bank. https://documents.worldbank.org/curated/en/645821468337815208/pdf/487910PUB0EPI1101Official0Use0Only1.pdf

Raymond, M., & DeNardis, L. (2015). Multistakeholderism: Anatomy of an inchoate global institution. *International Theory, 7*(3), 572–616. https://doi.org/10.1017/S1752971915000081

Starosielski, N. (2015). *The undersea network*. Duke University Press. https://www.dukeupress.edu/the-undersea-network

TeleGeography. (n.d.). *Submarine cable map*. https://www.submarinecablemap.com/

---

## License

Unless otherwise specified in a dedicated `LICENSE` file, the code and teaching materials in this repository should be treated as course materials requiring attribution. Data redistributed from third-party sources remain subject to the licenses and terms of their original providers.
