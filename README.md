# Global Patterns in Reported Human Rabies Deaths (2010–2024)

## Project Overview

This project examines global patterns in reported human rabies deaths between 2010 and 2024. Using data from the World Health Organization (WHO) and World Bank, I explored how reported rabies deaths vary over time, across countries, and in relation to economic status and geographic region.

This was my first independent epidemiological data analysis project using R. The goal was to gain experience working with real-world public health data, applying statistical tests, and interpreting epidemiological findings.

## Research Objectives

- Identify countries with the highest cumulative reported human rabies deaths.
- Examine changes in reported deaths between 2010 and 2024.
- Investigate the relationship between GDP per capita and reported rabies deaths.
- Compare reported rabies deaths across income groups and geographic regions.

## Data Sources

- World Health Organization: Global Health Observatory data on reported human rabies deaths.
- World Bank: GDP per capita (current US$), income classifications, and geographic regions.

## Methods and Tools

The analysis was completed using R and RStudio, with Quarto used to produce the research report.

R packages used include dplyr, tidyr, readr, and ggplot2.

The analysis involved data cleaning, merging datasets, creating visualizations, and conducting statistical tests, including:
  - Spearman rank correlation
  - Kruskal–Wallis tests
  - Pairwise Wilcoxon tests with multiple-comparison adjustments

## Key Findings

The analysis identified substantial variation in reported human rabies deaths across countries and years.

A moderate negative association was observed between GDP per capita and cumulative reported human rabies deaths (Spearman's ρ ≈ −0.45). Statistically significant differences were also identified across income groups and geographic regions among countries with positive cumulative reported deaths.

These findings suggest that economic status and geographic region are associated with differences in reported rabies burden, although the analysis cannot establish causation.

## Limitations

This analysis relied on reported surveillance data, which may not capture the true number of human rabies deaths. Reporting completeness varied between countries and years, and cumulative death totals were not adjusted for population size or differences in reporting duration.

Countries with zero cumulative reported deaths were excluded from certain statistical comparisons. Therefore, those results describe countries with positive reported death totals rather than all countries.

Future improvements could include population-adjusted mortality rates, more detailed evaluation of missing data, and additional epidemiological variables.

## Project Files

- rabies_analysis.qmd — Quarto source file containing the R code and analysis.
- rabies_analysis.html — Rendered HTML report.
- data/ — Datasets used in the analysis.

## Full Report

The complete analysis, including visualizations, statistical results, discussion, and references, is available in the report files included in this repository.
