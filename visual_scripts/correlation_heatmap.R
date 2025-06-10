library(ggplot2)
library(reshape2)
library(dplyr)

# Compute correlations
num_data <- SmashData %>%
  select(where(is.numeric)) %>%
  na.omit()

cor_mat <- cor(num_data)

# Melt for ggplot
cor_melted <- melt(cor_mat)

# Plot
heatmap_plot <- ggplot(cor_melted, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  scale_fill_gradient2(low = "blue", high = "red", mid = "white", midpoint = 0) +
  theme_minimal() +
  coord_fixed() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1, size = 8),
    axis.text.y = element_text(size = 8)
  ) +
  labs(title = "Correlation Heatmap", x = "", y = "", fill = "Correlation")

# Save bigger version
ggsave("visuals/correlation_heatmap.png", plot = heatmap_plot, width = 14, height = 12)