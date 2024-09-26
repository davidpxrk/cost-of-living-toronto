#### Preamble ####
# Purpose: Cleans the raw data of Toronto's cost of living for the parameters
# Author: Hyunje Park
# Date: 24 September 2024
# Contact: hyunje.park@mail.utoronto.ca 
# License: MIT
# Pre-requisites: 01-download_data.R, packages listed below.

#### Workspace setup ####
#install.packages('opendatatoronto')
#install.packages("dplyr")
#install.packages('tidyverse')
#install.packages('sf')

library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(sf)

#### Clean data ####
raw_data <- read.csv("data/raw_data/raw_data.csv")
head(raw_data, 2)

# remove the last column, it is empty for no reason
raw_data <- raw_data[1:(length(raw_data)-1)]

# replace all the NA values with 0 
raw_data[is.na(raw_data)] <- 0

# rename Scenarios to Household to fit context better
colnames(raw_data) = c("Category", "Item", 
                       "Household_1",
                       "Household_2",
                       "Household_3",
                       "Household_4",
                       "Household_5",
                       "Household_6",
                       "Household_7",
                       "Household_8",
                       "Household_9",
                       "Household_10",
                       "Household_11")

cleaned_data <- raw_data

#inverted version of raw_data, will need it for graphs in Section 3 Results
cleaned_data_inverted <- data.frame(t(raw_data[-1]))
colnames(cleaned_data_inverted) <- raw_data[, 1]

# change all the column names for inverted dataframe
colnames(cleaned_data_inverted) <- c("Income 1",
                              "Income 2",
                              "Income 3",
                              "Income 4",
                              "Income 5",
                              "Income 6",
                              "Income 7",
                              "Income 8",
                              "Income 9",
                              "Expense 1",
                              "Expense 2",
                              "Income 10",
                              "Income 11",
                              "Total Income",
                              "Expense 3",
                              "Expense 4",
                              "Expense 5",
                              "Expense 6",
                              "Total Expenses",
                              "Remaining Funds",
                              "Other 2",
                              "Other 3")

# delete the first row (empty as well, unnecessary)
cleaned_data_inverted <- cleaned_data_inverted[-1,]

# change all the column datatype back to double
cleaned_data_inverted[] <- sapply(cleaned_data_inverted, as.numeric)
cleaned_data_inverted$"Household" <-  c("Household_1",
                                 "Household_2",
                                 "Household_3",
                                 "Household_4",
                                 "Household_5",
                                 "Household_6",
                                 "Household_7",
                                 "Household_8",
                                 "Household_9",
                                 "Household_10",
                                 "Household_11")

# Save data
write_csv(cleaned_data, 'data/cleaned_data/cleaned_data.csv')
write_csv(cleaned_data_inverted, 'data/cleaned_data/cleaned_data_inverted.csv')

