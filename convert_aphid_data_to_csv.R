# This R script reads an Excel spreadsheet containing aphid trap capture data
# for the years 1992-1994 and 1998-2003, and writes it to a CSV text file.

# Locations of input and output files
input.file <- "aphid_data_1992-1994_and_1998-2003.xls"
output.file <- "aphid_data_1992-1994_and_1998-2003.csv"
species.code.file <- "species_codes.csv"
location.code.file <- "location_codes.csv"

# Load required libraries
library(xlsx, quietly=TRUE)
library(dplyr, quietly=TRUE)

# Read the worksheets for all years into a list
years <- c("1992", "1993", "1994", "1998_samp", "1999", "2000", "2001", "2002", "2003")
data = list()
for (i in seq(years))
    data[[i]] <- read.xlsx2(input.file, years[[i]], colClasses="character")

# Concatenate into a single data frame
allyears <- rbind_all(data)
rm(data)

# Remove unneeded columns
allyears$X. <- NULL
allyears$TOTAL_A <- NULL

# Excel stores dates as number of days after 1900-01-01.
# Change back to date format.
allyears$DATE <- as.Date(as.numeric(allyears$DATE), origin="1899-12-30")


# Remove summary rows, which lack valid dates. 
allyears <- allyears[!is.na(allyears$DATE), ]

# Convert week number and aphid counts to numeric. 
allyears$WEEK <- as.numeric(allyears$WEEK)
for (i in (7:ncol(allyears))) {
    allyears[[i]] <- as.numeric(as.character(allyears[[i]]))
}

# Write data frame to CSV file.
write.csv(allyears, output.file, row.names=FALSE)

# Write codebook
codes <- read.xlsx2(input.file, "key", colClasses="character")
write.csv(codes[, 1:2], species.code.file, row.names=FALSE)
codes <- codes[codes$Site != "", 4:5]
names(codes)[[2]] <- "Code"
write.csv(codes, location.code.file, row.names=FALSE)
