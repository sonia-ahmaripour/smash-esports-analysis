library(ggplot2)
library(dplyr)

ggplot(SmashData, aes(x = Damage_Taken, fill = factor(TWins))) +
  geom_density(alpha = 0.5) +
  scale_fill_manual(values = c("0" = "red", "1" = "green"), labels = c("Loss", "Win")) +
  theme_minimal() +
  labs(
    title = "Damage Taken: Winners vs Losers",
    x = "Damage Taken",
    y = "Density",
    fill = "Match Outcome"
  )

ggsave("visuals/density_damage_winners_vs_losers.png", width = 6, height = 4)