library(ggplot2)
library(dplyr)

SmashData <- readxl::read_excel("data/Smash_Data.xlsx", sheet = "For Logistic Regression")

p <- ggplot(SmashData, aes(x = Damage_Taken, y = Winp)) +
  geom_point() +
  theme_minimal()

ggsave("visuals/damage_vs_winp.png", plot = p, width = 6, height = 4)