# ------------------------------------------------------------
# Script: 04_character_regressions.R
# Purpose: Run logistic regressions per character and export key findings
# Author: Sonia Ahmaripour
# ------------------------------------------------------------

setwd("/Users/soniaahmaripour/Desktop/smash-esports-analysis")

library(readxl)
library(pscl)

characters <- c("Byleth", "Cloud", "Fox", "Joker", "Kazuya", "Lucina", "Mario", 
                "Pokemon Trainer", "R.O.B.", "Snake", "Steve")

results <- data.frame(
  Character = character(),
  Predictors = character(),
  Significant = logical(),
  PseudoR2 = numeric(),
  Notes = character(),
  stringsAsFactors = FALSE
)

for (char in characters) {
  cat("--- ", char, " ---\n")
  data <- read_excel("data/Smash_Data.xlsx", sheet = char)
  data$TWins <- as.factor(data$TWins)
  
  model <- glm(TWins ~ Combo + Block + Style, data = data, family = "binomial")
  pR2_val <- round(pR2(model)[["McFadden"]], 3)
  summ <- summary(model)
  sig <- any(summ$coefficients[-1, 4] < 0.05)  # exclude intercept
  
  predictors <- paste(names(which(summ$coefficients[-1, 4] < 0.05)), collapse = ", ")
  predictors <- ifelse(predictors == "", "None", predictors)
  
  results <- rbind(results, data.frame(
    Character = char,
    Predictors = predictors,
    Significant = sig,
    PseudoR2 = pR2_val,
    Notes = ""
  ))
}

write.csv(results, "summary_tables/character_findings.csv", row.names = FALSE)