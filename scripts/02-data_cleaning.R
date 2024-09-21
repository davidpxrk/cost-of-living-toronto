#### Preamble ####
# Purpose: Cleans the raw data of Toronto's cost of living for the parameters
# Author: Hyunje Park
# Date: 24 September 2024
# Contact: hyunje.park@mail.utoronto.ca 
# License: MIT
# Pre-requisites: [...UPDATE THIS...]

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


#### Save data ####
#write.csv(cleaned_data, "data/cleaned_data/cleaned_data.csv")
