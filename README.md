# Global Patterns in Reported Human Rabies Deaths (2010–2024)

Are reported human rabies deaths from 2010 to 2024 higher in countries with lower GDP per capita, a lower World Bank income group, or in particular regions, once population and reporting coverage are taken into account?

This was my first independent epidemiological data analysis in R. The report is the place to read it. Code is folded in the HTML and can be opened section by section.

**Report:** [https://angelov1053.github.io/rabies-analysis/](https://angelov1053.github.io/rabies-analysis/)

## Question

- Which countries reported the most human rabies deaths from 2010 to 2024, and which had the highest population-adjusted rates?
- How did the yearly totals, and the number of countries behind them, change over time?
- Are GDP per capita, World Bank income group, and region associated with the reported death rate?

## Data

- WHO Global Health Observatory, reported number of human rabies deaths, 2010–2024. A blank is "no report," not a zero.
- World Bank GDP per capita (current US$), population, income group, and region.
- Countries are linked on the ISO3 code, not the English country name.

File names, download dates, and column definitions are in [`data/README.md`](data/README.md). Two CDC NNDSS extracts and a total-GDP file are in `data/not-used/` and are not used.

## Methods

R, Quarto, and the packages in `renv.lock` (directly: readr, dplyr, tidyr, ggplot2, scales, broom, knitr, and MASS).

For each country I summed reported deaths over the years with a numeric report and divided by the population in those years. The rate is reported deaths per 100,000 person-years. Spearman correlation describes the rank association with GDP per capita. A negative binomial model with a population offset estimates rate ratios for GDP per capita, income group, and region. Zeros stay in the main model. Fits that drop zeros, or that add region to the GDP model, are sensitivity checks. A Poisson model was too tight for these counts, so it is not the reported model.

## Key findings

Numbers below are from the rendered report.

- From 2010 through 2019, between 99 countries (2013) and 124 countries (2015 and 2016) filed a numeric report. The count was above 100 in 9 of those 10 years. It was 101 in 2020, then 98, 84, 77, and 56 from 2021 through 2024. In 2010, 76 of 105 reporting countries reported zero deaths. In 2024, 7 of 56 did.
- Summed reported deaths were highest in 2016 (3,438), 2010 (2,983), and 2017 (2,922), and lowest in 2021 (1,125). After 2021 the sum rose again, to 2,767 in 2023. India (1,005), Kenya (727), and China (644) were 69% of the 2016 total. The low years 2018–2021 still had about 98 to 105 countries reporting, so that dip is not a collapse in the number of countries in the file.
- China (10,524), India (4,712), and the Philippines (4,123) reported the most deaths. China's average GDP per capita on this list is about $9,100. The other nine countries range from about $760 to about $4,500, all below $5,000. On the rate scale China ranks 34th of 169 countries (0.054 per 100,000 person-years).
- The highest rate in the file is Liberia, 3.60 per 100,000 person-years, from 940 deaths over 5 reporting years. Several other high rates rest on one or two years or on a handful of deaths. The Philippines, Kenya, Angola, and Liberia are the countries on both top-10 lists.
- Spearman correlation between GDP per capita and the country rate is −0.71 with zero-death countries included (167 countries) and −0.70 with them excluded (103 countries). The same correlation using cumulative deaths, among countries with at least one death, is −0.47.
- In the negative binomial model, a doubling of GDP per capita is associated with a rate ratio of 0.31 (95% CI 0.27 to 0.36). Excluding zeros, the ratio is 0.38 (0.33 to 0.44). Adding region, it is 0.41 (0.35 to 0.49).
- High-income countries reported 110 deaths in the linked sample, and 42 of 58 reported none (pooled rate about 0.0008 per 100,000 person-years). The low-income pooled rate is about 0.11, roughly 138 times the high-income pooled rate. The model rate ratio versus high income is larger than that, because a few high-rate countries and the many high-income zeros pull it. The pooled rates are the better description of the size of the gap. China and the Philippines account for 82% of upper-middle-income deaths.
- Sub-Saharan Africa has the highest pooled regional rate, about 39 times the pooled rate in Europe and Central Asia. East Asia and Pacific has the most deaths, and China is 58% of that total.

These are associations in reported, country-level data. They are not estimates of the effect of GDP or income, and they are not the modeled global burden of rabies.

## Limitations

Reported deaths are not all deaths. A widely cited estimate for endemic canine rabies is about 59,000 deaths a year, far above the roughly 1,100 to 3,400 deaths a year summed here. Countries do not report every year, and the number reporting falls after 2021, so person-years cover only years with a number in the WHO file. Income group is one World Bank label for the whole period, not the group a country held in each year. GDP per capita is in current US dollars. The ecological fallacy applies: a country average does not say which people inside the country are at higher risk. French Guiana (3 deaths) has no World Bank code. South Sudan and Eritrea have no GDP per capita in the years they reported, so they are in the rate and income results and not in the GDP model.

## Reproduce

This copy was rendered with R 4.3.3 and Quarto 1.11.9. Other recent versions should work. Package versions are pinned in `renv.lock`, and `sessionInfo()` is at the end of the report.

```bash
git clone https://github.com/angelov1053/rabies-analysis.git
cd rabies-analysis
Rscript -e 'install.packages("renv", repos = "https://cloud.r-project.org")'
Rscript -e 'renv::restore()'
quarto render
```

`quarto render` writes `docs/rabies_analysis.html` and refreshes `docs/index.html`, which is what GitHub Pages serves.

### GitHub Pages

After this work is on `main`:

1. Open the repository on GitHub and go to **Settings → Pages**.
2. Under **Build and deployment**, set **Source** to **Deploy from a branch**.
3. Set the branch to **main** and the folder to **/docs**. Save.
4. Wait a minute or two. The report will be at [https://angelov1053.github.io/rabies-analysis/](https://angelov1053.github.io/rabies-analysis/).

The repository is public, so Pages on the free plan can serve it. To preview before merge, the same settings can point at this branch and `/docs`, then be switched back to `main` after merge.

## License

The code and this write-up are under the MIT license. See [LICENSE](LICENSE). WHO, World Bank, and CDC data are not covered by that license and stay under the providers' terms.

## Project files

- `rabies_analysis.qmd` — source for the report.
- `docs/` — rendered HTML for GitHub Pages.
- `data/raw/` — files the report reads. `data/not-used/` — files it does not.
- `renv.lock` — package versions.
- `rabies-analysis.Rproj` — RStudio project file.
