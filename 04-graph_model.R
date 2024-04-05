#### Preamble ####
# Purpose: Graph and Model the Cancer Dataset from Sydney Hospitals
# Author: Yuchao Niu
# Date: April 4th, 2024
# Contact: yc.niu@utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(rstanarm)

#### Graph ####
cancer_data |>
  ggplot(aes(x = Year, y = Deaths, color = factor(Hospital))) +
  geom_line() +
  theme_minimal() + 
  labs(x = "Year", y = "Number of deaths by hospital") +
  facet_wrap(vars(Hospital), dir = "v", ncol = 1) +
  theme(legend.position = "none") +
  coord_cartesian(ylim = c(0, max(cancer_data$Deaths) * 1.1))

#### Model ####
model_1 <-
  stan_glm(
    Deaths ~ Hospital,
    data = cancer_data,
    family = neg_binomial_2(link = "log"),
    seed = 853
  )

summary(model_1)

# Model Check
pp_check(model_1) +
  theme(legend.position = "bottom")
