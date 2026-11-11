# Files not used in the report

These files were in the original `data/` folder. They are not imported by `rabies_analysis.qmd`. They were moved here, not deleted, so the project history stays easy to follow.

## `wb_ny_gdp_mktp_cd_total_gdp.csv`

World Bank indicator **NY.GDP.MKTP.CD**, GDP (current US$).

Original filename: `API_NY.GDP.MKTP.CD_DS2_en_csv_v2_234.csv`.

The analysis uses GDP per capita (`NY.GDP.PCAP.CD` in `data/raw/`), not total GDP. The country metadata from this same download is used, and it lives at `data/raw/wb_country_metadata.csv`.

## NNDSS extracts

CDC National Notifiable Diseases Surveillance System, Table 1CC, rabies in animals and humans. Weekly US reporting areas, not the WHO country-year series.

| File now | Original filename | What the header refers to |
| --- | --- | --- |
| `nndss_rabies_human_animal_extract_a.csv` | `NNDSS_-_TABLE_1CC._Rabies,_Animal_to_Rabies,_Human_20260705 copy.csv` | Cumulative columns labeled 2020 and 2019. Larger file. The word "copy" was in the filename. It is not a duplicate of the other extract. |
| `nndss_rabies_human_animal_extract_b.csv` | `NNDSS_-_TABLE_1CC._Rabies,_Animal_to_Rabies,_Human_20260705.csv` | Cumulative columns labeled 2022 and 2021. |

Neither file is used. US weekly surveillance does not answer the question this report asks, which is about WHO-reported human deaths by country from 2010 to 2024.

CDC data remain under CDC terms.
