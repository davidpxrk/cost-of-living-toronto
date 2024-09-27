#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Hyunje Park
# Date: 24 September 2024
# Contact: hyunje.park@mail.utoronto.ca 
# Pre-requisites: Packages listed below

#### Workspace setup ####
library(tidyverse)

#### EXPECTED DATA ####
# Columns: Income 1-11, Expense 1-6
# 
# All the variables contain values within the specified ranges below.
# Determined by the average of the scenarios.

# number of observations
obs = 100

#### Simulate data ####
simulated_data <-
  tibble(
    "Income_1" = sample(1:1603, obs, replace = TRUE),
    "Income_2" = sample(1:365, obs, replace = TRUE),
    "Income_3" = sample(1:337, obs, replace = TRUE),
    "Income_4" = sample(1:157, obs, replace = TRUE),
    "Income_5" = sample(1:8, obs, replace = TRUE),
    "Income_6" = sample(1:480, obs, replace = TRUE),
    "Income_7" = sample(1:48, obs, replace = TRUE),
    "Income_8" = sample(1:121, obs, replace = TRUE),
    "Income_9" = sample(1:43, obs, replace = TRUE),
    "Income_10" = sample(1:45, obs, replace = TRUE),
    "Income_11" = sample(1:4, obs, replace = TRUE),
    "Expense_1" = sample(1:24, obs, replace = TRUE),
    "Expense_2" = sample(1:81, obs, replace = TRUE),
    "Expense_3" = sample(1:3146, obs, replace = TRUE),
    "Expense_4" = sample(1:705, obs, replace = TRUE),
    "Expense_5" = sample(1:360, obs, replace = TRUE),
    "Expense_6" = sample(1:460, obs, replace = TRUE),
  )

# ensure all income/expense columns exist
simulated_data
names(simulated_data)

# get the sum of income and expenses
simulated_data$"sum_income" <- rowSums(subset(simulated_data, select = c("Income_1",
                                                                     "Income_2",
                                                                     "Income_3",
                                                                     "Income_4",
                                                                     "Income_5",
                                                                     "Income_6",
                                                                     "Income_7",
                                                                     "Income_8",
                                                                     "Income_9",
                                                                     "Income_10",
                                                                     "Income_11"
)))

simulated_data$"sum_expenses" <- rowSums(subset(simulated_data, select = c("Expense_1",
                                                                       "Expense_2",
                                                                       "Expense_3",
                                                                       "Expense_4",
                                                                       "Expense_5",
                                                                       "Expense_6"
)))

# Get the difference between the sum of income and expenses
simulated_data$"difference" <- (simulated_data$"sum_income" - simulated_data$"sum_expenses")
simulated_data %>% select("sum_income", "sum_expenses", "difference")

# FINAL TEST - there should be more negative rows than positive rows
# (this is the assumption from paper.qmd, that is being tested)
# (implies people cannot financially survive in toronto)
print(sum(simulated_data$difference < 0) > sum(simulated_data$difference >= 0))






