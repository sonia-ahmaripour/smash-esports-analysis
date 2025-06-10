reg_plot <- ggplot(SmashData, aes(x = GAttack, y = TWins)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "glm", method.args = list(family = "binomial")) +
  theme_minimal() +
  labs(title = "Logistic Regression: GAttack vs TWins")

ggsave("visuals/regression_gattack_twins.png", plot = reg_plot, width = 6, height = 4)