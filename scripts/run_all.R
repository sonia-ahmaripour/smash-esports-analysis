# ------------------------------------------------------------
# Script: run_all.R
# Purpose: Master script to run all analysis steps
# Author: Sonia Ahmaripour
# ------------------------------------------------------------

source("scripts/01_load_clean_data.R")
source("scripts/02_correlation_matrix.R")
source("scripts/03_logistic_regressions.R")
source("scripts/04_character_regressions.R")
source("scripts/05_character_findings.R")