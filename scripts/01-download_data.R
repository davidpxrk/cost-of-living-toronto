#### Preamble ####
# Purpose: Downloads and saves the data from OpenDataToronto
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
#### Download data ####

# get package
link <- "52182614-1f0b-42be-aca4-3f86dc8e004c"

package <- show_package("52182614-1f0b-42be-aca4-3f86dc8e004c")
package

# get all resources for this package
resources <- list_package_resources(link)

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))
datastore_resources

# load the first data store resource as a sample
raw_data <- filter(resources,row_number()==5) %>% get_resource()
raw_data

#### Save data ####

# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_data, "data/raw_data/raw_data.csv") 

         
