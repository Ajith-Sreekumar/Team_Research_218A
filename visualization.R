# Load the required library
library(tidyverse)

# Load the dataset
data <- read_csv("veriler.csv")
head(data,2) 
data1 <- head(data, 2)

# Ensure columns Der(km) and ML are numeric
data_filtered <- data %>%
  mutate(
    `Der(km)` = as.numeric(`Der(km)`),
    ML = as.numeric(ML)
  ) %>%
  select(`Der(km)`, ML) %>%
  drop_na()

# Save all plots into a PDF
pdf("visualization.pdf", width = 10, height = 6)

# 1. Scatter Plot with Regression Line
ggplot(data_filtered, aes(x = `Der(km)`, y = ML)) +
  geom_point(alpha = 0.6) +
  geom_smooth(method = "lm", color = "red", se = FALSE) +
  labs(
    title = "Scatter Plot: Depth (Der(km)) vs Earthquake Magnitude (ML)",
    x = "Depth (Der(km))",
    y = "Earthquake Magnitude (ML)"
  ) +
  theme_minimal()

# 2. Histogram and Density Plot for Depth (Der(km))
ggplot(data_filtered, aes(x = `Der(km)`)) +
  geom_histogram(aes(y = ..density..), bins = 30, fill = "green", alpha = 0.5) +
  geom_density(color = "red", size = 1) +
  labs(
    title = "Histogram and Density Plot: Depth (Der(km))",
    x = "Depth (Der(km))",
    y = "Density"
  ) +
  theme_minimal()

# 3. Histogram and Density Plot for Earthquake Magnitude (ML)
ggplot(data_filtered, aes(x = ML)) +
  geom_histogram(aes(y = ..density..), bins = 30, fill = "blue", alpha = 0.5) +
  geom_density(color = "red", size = 1) +
  labs(
    title = "Histogram and Density Plot: Earthquake Magnitude (ML)",
    x = "Earthquake Magnitude (ML)",
    y = "Density"
  ) +
  theme_minimal()

# Close the PDF device
dev.off()

