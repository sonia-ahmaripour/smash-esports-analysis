# ------------------------------------------------------------
# Script: 01_load_clean_data.R
# Purpose: Load and clean the Smash data from Excel
# Author: Sonia Ahmaripour
# ------------------------------------------------------------

setwd("/Users/soniaahmaripour/Desktop/smash-esports-analysis")

library(readxl)
library(dplyr)

SmashData <- read_excel("data/Smash_Data.xlsx", sheet = "For Logistic Regression")
summary(SmashData)

if (interactive()) View(SmashData)

# Save backup as .csv
write.csv(SmashData, "data/SmashData.csv", row.names = FALSE)