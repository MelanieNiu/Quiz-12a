#### Preamble ####
# Purpose: Simulate the Cancer Dataset from Sydney Hospitals
# Author: Yuchao Niu
# Date: April 4th, 2024
# Contact: yc.niu@utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(ggplot2)

#### Simulate data ####
# Set seed for reproducibility
set.seed(123)

# Define the number of years and hospitals
num_years <- 20
num_hospitals <- 5
hospital_names <- c("Hospital 1", "Hospital 2", "Hospital 3", "Hospital 4", "Hospital 5")

# Create a data frame to store the simulated data
cancer_data <- data.frame(
  Year = rep(seq(2004, 2023), each = num_hospitals), # Repeat years for each hospital
  Hospital = rep(hospital_names, times = num_years) # Hospital index
) 

# Simulate number of deaths for each hospital and year using Negative Binomial distribution
lambda <- 120  
dispersion <- 0.5  

for (i in 1:nrow(cancer_data)) {
  cancer_data$Deaths[i] <- rnbinom(1, mu = lambda, size = dispersion)
}

head(cancer_data)

