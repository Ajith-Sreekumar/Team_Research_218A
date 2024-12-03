# Load required library
library(tidyverse)

# Load the dataset
data <- read_csv("veriler.csv")

# Ensure columns Der(km) and ML are numeric
data_filtered <- data %>%
  mutate(
    `Der(km)` = as.numeric(`Der(km)`),
    ML = as.numeric(ML)
  ) %>%
  select(`Der(km)`, ML) %>%
  drop_na()

# Perform Spearman's Rho correlation
spearman_test <- cor.test(data_filtered$`Der(km)`, data_filtered$ML, method = "spearman")

# Print Spearman's Rho results
print(paste("Spearman's Rho correlation coefficient:", round(spearman_test$estimate, 2)))
print(paste("Spearman's Rho p-value:", spearman_test$p.value))
