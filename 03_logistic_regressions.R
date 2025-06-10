# ------------------------------------------------------------
# Script: 03_logistic_regressions.R
# Purpose: Logistic regression models for win prediction
# Author: Sonia Ahmaripour
# ------------------------------------------------------------

setwd("/Users/soniaahmaripour/Desktop/smash-esports-analysis")

library(readxl)
library(car)
library(pscl)

SmashData <- read_excel("data/Smash_Data.xlsx", sheet = "For Logistic Regression")

TWinsLRM <- glm(TWins ~ GAttack + AAttack + Combo + Block + Style,
                data = SmashData, family = "binomial")

cat("=== Summary: Main Model ===\n")
summary(TWinsLRM)

cat("\n=== VIF ===\n")
print(vif(TWinsLRM))

cat("\n=== McFadden's R² ===\n")
print(pR2(TWinsLRM))