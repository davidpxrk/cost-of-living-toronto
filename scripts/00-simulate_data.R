#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Hyunje Park
# Date: 24 September 2024
# Contact: hyunje.park@mail.utoronto.ca 
# Pre-requisites: Packages listed below

#### Workspace setup ####
library(tidyverse)

#### EXPECTED DATA ####
# Columns: Income 1-11, Expense 3-6
# 
# All the variables contain values within the specified ranges below.
# Determined by the average of the scenarios

# number of observations
obs = 100

#### Simulate data ####
simulated_data <-
  tibble(
    "Income_1" = sample(1:3000, obs, replace = TRUE)
    
    
  
  )

print(simulated_data)

