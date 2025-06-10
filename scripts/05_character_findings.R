# ------------------------------------------------------------
# Script: 05_character_findings.R
# Purpose: Run logistic regressions for each character and record results
# Author: Sonia Ahmaripour
# ------------------------------------------------------------

# Only use View() if running interactively
if (interactive()) View(SmashData)

# Load libraries
library(readxl)
library(dplyr)
library(broom)
library(pscl)

# Load data
SmashData <- read_excel("data/Smash_Data.xlsx", sheet = "For Logistic Regression")

# Set predictors to test
predictors <- c("GAttack", "AAttack", "Combo", "Block", "Style", "AABase", "Gravity", "RSpeed", "Grab")

# Prepare empty results list
results <- list()

# Loop through each character
for (char in unique(SmashData$Characters)) {
  
  # Filter data for this character
  char_data <- SmashData %>% filter(Characters == char)
  
  # Skip characters with <5 games to avoid unreliable models
  if (nrow(char_data) < 5) next
  
  # Create formula for regression
  formula <- as.formula(paste("TWins ~", paste(predictors, collapse = " + ")))
  
  # Fit model
  model <- try(glm(formula, data = char_data, family = "binomial"), silent = TRUE)
  
  # Skip if model failed
  if (inherits(model, "try-error")) next
  
  # Get tidy output
  tidy_model <- broom::tidy(model)
  
  # Find significant predictors (p < 0.05)
  sig_preds <- tidy_model %>%
    filter(term != "(Intercept)", p.value < 0.05) %>%
    pull(term)
  
  # Get Pseudo R-squared
  pseudo_r2 <- try(pR2(model)$McFadden, silent = TRUE)
  if (inherits(pseudo_r2, "try-error")) pseudo_r2 <- NA
  
  # Save result
  results[[char]] <- data.frame(
    Character = char,
    Predictors = ifelse(length(sig_preds) > 0, paste(sig_preds, collapse = ", "), "None"),
    Significant = length(sig_preds) > 0,
    PseudoR2 = round(pseudo_r2, 3),
    Notes = ""
  )
}

# Combine all results into one dataframe
final_results <- do.call(rbind, results)

# Save to CSV
if (!dir.exists("summary_tables")) dir.create("summary_tables")
write.csv(final_results, "summary_tables/character_findings.csv", row.names = FALSE)

# View the table (only if running interactively)
if (interactive()) View(final_results)