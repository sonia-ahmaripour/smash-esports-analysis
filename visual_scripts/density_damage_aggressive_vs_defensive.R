ggplot(SmashData, aes(x = Damage_Taken, fill = Offensive_Defensive)) +
  geom_density(alpha = 0.5) +
  theme_minimal() +
  labs(
    title = "Damage Taken: Aggressive vs Defensive",
    x = "Damage Taken",
    y = "Density",
    fill = "Playstyle"
  )

ggsave("visuals/density_damage_aggressive_vs_defensive.png", width = 6, height = 4)