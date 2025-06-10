density_plot <- ggplot(SmashData, aes(x = Damage_Taken)) +
  geom_density(fill = "purple", alpha = 0.5) +
  theme_minimal() +
  labs(title = "Distribution of Damage Taken")

ggsave("visuals/density_damage_taken.png", plot = density_plot, width = 6, height = 4)