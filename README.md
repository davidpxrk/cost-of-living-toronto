# Cost of Living in Toronto  

## Overview

This repository contains all the files required to build the report, **Cost of Living in Toronto: Are low-income families able to survive financially here?**. The report analyzes the livingcost data from low-income families living in Toronto, hosted publicly by the Open Data Toronto.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Open Data Toronto.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `other/sketches` contains the relevant sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Reproducing the Tables and Graphs
1. Clone this repository onto your computer
2. Download the data by running scripts/01-download_data.R
3. Clean the data by running scripts/01-data_cleaning.R
4. Run paper/paper.qmd to run the R Code for all the plots and tables.

## Statement on LLM usage

LLM and GPTs were NOT used in the making of this paper.
