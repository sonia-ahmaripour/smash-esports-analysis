library(ggplot2)
library(dplyr)
library(readr)

# Read your full CSV
char_results <- read_csv("summary_tables/character_findings.csv", show_col_types = FALSE)

# Convert PseudoR2 to numeric (handle any conversion issues)
char_results$PseudoR2 <- as.numeric(as.character(char_results$PseudoR2))

# Replace NA PseudoR2 with 0 (to show them on heatmap)
char_results$PseudoR2[is.na(char_results$PseudoR2)] <- 0

# Order characters by PseudoR2 descending (strongest on top)
char_results$Character <- factor(
  char_results$Character,
  levels = char_results$Character[order(char_results$PseudoR2, decreasing = TRUE)]
)

# Create heatmap plot
heatmap <- ggplot(char_results, aes(x = "", y = Character, fill = PseudoR2)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "#d4e6f1", high = "#2e86c1", na.value = "grey80") +
  labs(
    title = "Model Strength per Character (Pseudo-R²)",
    y = "Character", x = NULL, fill = "Pseudo-R²"
  ) +
  theme_minimal() +
  theme(
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank()
  )

# Print plot to RStudio plot viewer (optional)
print(heatmap)

# Save PNG file
ggsave("visuals/heatmap_model_strength_all_characters.png", plot = heatmap, width = 6, height = 8)