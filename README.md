# Aphid Alert Data
## 1992-1994, 1998-2003

This repository contains aphid trap capture data that was
collected for the Aphid Alert project, which was led by
Edward Radcliffe and David Ragsdale at the University of
Minnesota. It includes data from the years 1992 through 1994
and 1998 through 2003.

The source dataset is an Excel workbook which was compiled by
Erin Hladilek in 2004.

## Files

* `aphid_data_1992-1994_and_1998-2003.xls` is the Excel workbook
   containing the source data
* `aphid_data_1992-1994_and_1998-2003.csv` is the CSV file
   generated from the Excel workbook.
* `location_codes.csv` lists the abbreviations for the aphid
   trap locations.
* `species_codes.csv` lists the abbreviations for the aphid species.
* `convert_aphid_data_to_csv.R` is the R script used to generate
   the CSV files

## Usage

To run the script, type the following at the command line:

  ``R -f convert_aphid_data_to_csv.R``

The script requires a recent version of R, which is a software
environment for statistical computing. It also requires the
`dplyr` and `xlsx` packages.
