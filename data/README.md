# Data dictionary and sources

The report reads only the files in `data/raw/`. Files in `data/not-used/` are kept so nothing from the original folder is thrown away without a record, and they are not imported.

Blank cells in the WHO file mean no report. They are not treated as zero deaths. A reported zero is a numeric zero.

## Files the report uses

### `raw/who_reported_human_rabies_deaths.csv`

WHO Global Health Observatory indicator **NTD_RAB2**, "Reported number of human rabies deaths."

Original filename in this project: `data/data.csv`. The file was renamed and moved; it was not re-downloaded. The `DateModified` field in the extract runs into 2025.

Source: <https://www.who.int/data/gho/data/indicators/indicator-details/GHO/reported-number-of-human-rabies-deaths>

Columns used:

| Column | Role in the report |
| --- | --- |
| `SpatialDimValueCode` | ISO 3166-1 alpha-3 code. This is the join key. |
| `Location` | Country name as published by WHO. Used as the display name. |
| `ParentLocation` | WHO region. Kept for reference. The models use the World Bank region instead, so region, income group, and GDP come from one classification system. |
| `Period` | Year. |
| `FactValueNumeric` | Reported deaths. This is the value used in the analysis. Empty means no data. |
| `Value` | Text form of the same number, or the words `No data`. Checked against `FactValueNumeric`, then not used. |

Other GHO columns in the extract (dimensions, uncertainty bounds, comments) are not used.

### `raw/wb_ny_gdp_pcap_cd.csv`

World Bank World Development Indicators, **NY.GDP.PCAP.CD**, GDP per capita (current US$).

Original filename: `API_NY.GDP.PCAP.CD_DS2_en_csv_v2_33610.csv`. The file header says last updated **2026-07-13**. The first four lines are the World Bank preamble; the report skips them.

Source: <https://data.worldbank.org/indicator/NY.GDP.PCAP.CD>

The analysis uses the country-year values for 2010–2024. Current US dollars are not adjusted for purchasing power.

### `raw/wb_sp_pop_totl.csv`

World Bank World Development Indicators, **SP.POP.TOTL**, Population, total. Midyear estimates of the de facto population, compiled in the World Development Indicators from the UN World Population Prospects, national statistical offices, and related sources (see the indicator metadata on the World Bank page).

Downloaded **2026-11-11** from the World Bank API:

`https://api.worldbank.org/v2/en/indicator/SP.POP.TOTL?downloadformat=csv`

The zip member was `API_SP.POP.TOTL_DS2_en_csv_v2_258623.csv`. The file header says last updated **2026-10-08**. It is saved here under a stable name. The report uses 2010–2024.

Source: <https://data.worldbank.org/indicator/SP.POP.TOTL>

### `raw/wb_country_metadata.csv`

Country metadata that shipped with Angelo's original World Bank download (the total-GDP extract `Metadata_Country_API_NY.GDP.MKTP.CD_DS2_en_csv_v2_234.csv`). The companion data file was last updated **2026-07-13**. A later population download had almost the same metadata (the table name for Nauru differed, and one aggregate code was new). This file was kept so the income groups stay the ones already in the project.

Columns used:

| Column | Role |
| --- | --- |
| `Country Code` | ISO3 join key. |
| `Region` | World Bank region. |
| `IncomeGroup` | World Bank income group for this vintage of the file, not the group a country belonged to in each year from 2010 to 2024. |
| `TableName` | World Bank short name. Not used as a join key. |

`SpecialNotes` is not used.

Income group and region are one label per country for the whole study period.

## Linkage

WHO `SpatialDimValueCode` is joined to World Bank `Country Code`. The report prints the match rate, the countries with no World Bank code, and the country-years with a death report but no GDP per capita.

English country names are not used as keys. WHO and World Bank spell many names differently (for example Tanzania, Viet Nam is actually the same in both, but "United Republic of Tanzania" and "Tanzania" are not). The report lists the names that differ.

## Files set aside

See `not-used/README.md`.

- `not-used/wb_ny_gdp_mktp_cd_total_gdp.csv` is total GDP (**NY.GDP.MKTP.CD**), not GDP per capita. The report never imported it.
- Two CDC NNDSS Table 1CC extracts are US weekly rabies tables. They are not part of the WHO country-year analysis.

## Terms

WHO, World Bank, and CDC data remain under those providers' terms. The MIT license in the repository root covers the code and the written report, not these files.
