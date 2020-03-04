# File:   Importing_Data.R
# Project:  IntroR_ODS

# INSTALL AND LOAD PACKAGES ################################

# Install pacman ("package manager") if needed
if (!require("pacman")) install.packages("pacman")

# Load contributed packages with pacman
pacman::p_load(pacman, party, rio, tidyverse)
# pacman: for loading/unloading packages
# party: for decision trees
# rio: for importing data
# tidyverse: for so many reasons

# LOAD AND PREPARE DATA ####################################

# Save data to "df" (for "data frame")
# Rename outcome as "y" (if it helps)
# Specify outcome with df$y

# Import CSV files with readr::read_csv() from tidyverse
(df <- read_csv("data/StateData.csv"))

# Import other formats with rio::import() from rio
(df <- import("data/StateData.xlsx") %>% as_tibble())

# or...

df <- import("data/StateData.xlsx") %>%
  as_tibble() %>%
  select(state_code, 
         psychRegions,
         instagram:modernDance) %>% 
  mutate(psychRegions = as.factor(psychRegions)) %>%
  rename(y = psychRegions) %>%
  print()

# ANALYZE DATA #############################################

# By using standardized object and variable names, the same
# code can be reused for different analyses

# Decision tree using party::ctree
# df[, -1]) excludes the state_code
fit <- ctree(y ~ ., data = df[, -1])  # Create tree
fit %>% plot()                        # Plot tree
fit %>%                               # Predicted vs true
  predict() %>%
  table(df$y)

hc <- df %>%  # Get data
  dist %>%    # Compute distance/dissimilarity matrix
  hclust %>%  # Compute hierarchical clusters
  plot(labels = df$state_code)  # Plot dendrogram

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L
# INSTALL AND LOAD PACKAGES ################################

# Load base packages manually
library(datasets)  # For example datasets
?datasets
library(help = "datasets")

# SOME SAMPLE DATASETS #####################################

# iris data
?iris
iris

# UCBAdmissions
?UCBAdmissions
UCBAdmissions

# Titanic
?Titanic
Titanic

# state.x77
?state.x77
state.x77

#swiss
?swiss
swiss



