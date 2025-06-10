# ------------------------------------------------------------
# Script: 02_correlation_matrix.R
# Purpose: Compute and export correlation matrix of numeric variables
# ------------------------------------------------------------

setwd("/Users/soniaahmaripour/Desktop/smash-esports-analysis")

library(readxl)

SmashData <- read_excel("data/Smash_Data.xlsx", sheet = "For Logistic Regression")
CorMat <- cor(SmashData[, sapply(SmashData, is.numeric)])

if (interactive()) View(CorMat)

# Save correlation matrix
if (!dir.exists("summary_tables")) dir.create("summary_tables")
write.csv(CorMat, "summary_tables/correlation_matrix.csv")