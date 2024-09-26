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
#install.packages('devtools')

library(tidyverse)
library(dplyr)
library(testthat)

# get the cleaned dataset
cleaned_data = read_csv(here::here('data/cleaned_data/cleaned_data.csv'))
# cleaned_data_inverted is just an inverted version of cleaned_data, no need to test.

#### Test cleaned_data ####

# test 1 - test that it has all the columns
test_that("Has all the columns",
          {expected = c("Category",
                       "Item",
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
          expect_equal(colnames(cleaned_data), expected)})

# test that the dataframe contains no NA values
test_that("No NA values", 
          {expect_equal(sum(is.na(cleaned_data)), 0)})

# test that all the Income/Expense variables are not negative
# (because you cant have negative income and expenses)
test_that("Income and Expense variables are not negative",
          {
          expect_true(all(cleaned_data$"Household_1" >= 0))
          expect_true(all(cleaned_data$"Household_2" >= 0))
          expect_true(all(cleaned_data$"Household_3" >= 0))
          expect_true(all(cleaned_data$"Household_4" >= 0))
          expect_true(all(cleaned_data$"Household_5" >= 0))
          expect_true(all(cleaned_data$"Household_6" >= 0))
          expect_true(all(cleaned_data$"Household_7" >= 0))
          expect_true(all(cleaned_data$"Household_8" >= 0))
          expect_true(all(cleaned_data$"Household_9" >= 0))
          expect_true(all(cleaned_data$"Household_10" >= 0))
          expect_true(all(cleaned_data$"Household_11" >= 0))
          }
          )


