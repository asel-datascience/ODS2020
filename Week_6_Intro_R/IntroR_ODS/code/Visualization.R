# File:    Visualisation.R
# Project:  IntroR_ODS

# INSTALL AND LOAD PACKAGES ################################

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, tidyverse)

# LOAD DATA ################################################

# Using the diamonds dataset from ggplot2
?diamonds  # Get information about the diamonds dataset
diamonds   # Display the beginning of the dataset

# BARPLOT OF FREQUENCIES ###################################

?plot     # Get info on "Generic X-Y Plotting
?barplot  # Get info on the "Bar Plots" function

# Shortest method to make a barplot
plot(diamonds$cut)

# Similar process using pipes
diamonds %>%
  select(color) %>%
  plot()

# Similar code using barplot(); doesn't work
diamonds %>%
  select(clarity) %>%
  barplot()  # Error: height must be a vector or a matrix

# Create frequency vector with table()
?table

# Try again with table()
diamonds %>%
  select(clarity) %>%
  table() %>%  # Put data in appropriate format
  barplot()

# Sort bars by decreasing values (not for ordinal X)
diamonds %>%
  select(clarity) %>%
  table() %>%
  sort(decreasing = T) %>%  # Sort table
  barplot()

# Add options to plot
diamonds %>%
  select(clarity) %>%
  table() %>%  # Put data in appropriate format
  barplot(
    main   = "Clarity of Diamonds",
    sub    = "(Source: ggplot2::diamonds)",
    horiz  = T,  # Draw horizontal bars
    ylab   = "Clarity of Diamonds",  # Flip axis labels
    xlab   = "Frequency",
    xlim   = c(0, 15000),  # Limits for X axis
    border = NA,  # No borders on bars
    col    = "#CD0000"  # red3
  )

# SIDE-BY-SIDE BARPLOT OF FREQUENCIES ######################

# 100% stacked bar
diamonds %>%
  select(color, clarity) %>%
  plot()

# Stacked bars: step 1: create table
df <- diamonds %>%
  select(color, clarity) %>%
  table() %>%
  print()  # Show table in Console

# Stacked bars: step 1: create graph
df %>%
  barplot(legend = rownames(.))  # Draw plot w/legend

# Side-by-side bar
df %>%
  barplot(
    legend = rownames(.),  # Dot is placeholder for pipe
    beside = T  # Put bars next to each other
  )

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L



# HISTOGRAMS


# INSTALL AND LOAD PACKAGES ################################

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, tidyverse)

# LOAD DATA ################################################

# Using the diamonds dataset from ggplot2
?diamonds  # Get information about the diamonds dataset
diamonds   # Display the beginning of the dataset

# HISTOGRAM ################################################

?hist

# Histogram with defaults
hist(diamonds$price)

# Histogram with options
hist(diamonds$price,
     breaks = 7,  # Suggest number of breaks
     main   = "Histogram of Price of Diamonds",
     sub    = "(Source: ggplot2::diamonds)",
     ylab   = "Frequency",
     xlab   = "Price of Diamonds",
     border = NA,  # No borders on bars
     col    = "#CD0000"  # red3
)

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Scatterplots

# INSTALL AND LOAD PACKAGES ################################

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, rio, tidyverse)

# LOAD AND PREPARE DATA ####################################

df <- import("data/StateData.xlsx") %>%
  as_tibble() %>%
  select(state_code, 
         psychRegions,
         instagram:modernDance) %>% 
  mutate(psychRegions = as.factor(psychRegions)) %>%
  print()

# SCATTERPLOTS #############################################

df %>%
  select(instagram:modernDance) %>% 
  plot()  # Plot all associations

# Bivariate scatterplot with defaults
df %>%
  select(scrapbook:modernDance) %>% 
  plot()

# Bivariate scatterplot with options
df %>%
  select(scrapbook:modernDance) %>% 
  plot(
    main = "Scatterplot of Google Searches by State",
    xlab = "Searches for \"scrapbook\"",
    ylab = "Searches for \"modern dance\"",
    col  = "gray",  # Color of points
    pch  = 20,      # "Plotting character" (small circle)
  )

?pch  # See plotting characters

# Add fit linear regression line (y ~ x) 
df %>%
  lm(modernDance ~ scrapbook, data = .) %>%
  abline()

# REMOVE OUTLIER ###########################################

# Identify outlier
df %>%
  select(state_code, scrapbook) %>%
  filter(scrapbook > 4) %>%  # Select outlier
  print()

# Bivariate scatterplot without outlier
df %>%
  select(scrapbook:modernDance) %>% 
  filter(scrapbook < 4) %>%  # filter out outlier
  plot(
    main = "Scatterplot of Google Searches by State",
    xlab = "Searches for \"scrapbook\"",
    ylab = "Searches for \"modern dance\"",
    col  = "gray",  # Color of points
    pch  = 20,      # "Plotting character" (small circle)
  )

# Add fit line without outlier
df %>%
  filter(scrapbook < 4) %>%  # filter out outlier
  lm(modernDance ~ scrapbook, data = .) %>%
  abline()

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# Linecharts

# INSTALL AND LOAD PACKAGES ################################

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, tidyverse)

# Load base packages manually
library(datasets)  # For example datasets

# SINGLE TIME SERIES #######################################

# uspop
?uspop  # Get info about data
uspop   # Display data

?ts  # Get info about time-series objects

# Plot with default plot()
plot(uspop)

# Plot with options
uspop %>% 
  plot(
    main = "US Population 1790–1970 ",
    sub  = "(Source: datasets::uspop)",
    xlab = "Year",
    ylab = "Population (in millions)",
  )
abline(v = 1930, col = "lightgray")
text(1930, 10, "1930", col = "red3") 
abline(v = 1940, col = "lightgray")
text(1940, 2, "1940", col = "red3") 

# Plot with ts.plot()
?ts.plot
# Although this can be used for a single time series, plot
# is easier to use and is preferred.
ts.plot(uspop)

# Plot with plot.ts()
# More powerful alternative
?plot.ts
plot.ts(uspop)

# MULTIPLE TIME SERIES #####################################

# EuStockMarkets
?EuStockMarkets
EuStockMarkets

# Three different plot functions
plot(EuStockMarkets)     # Stacked windows
plot.ts(EuStockMarkets)  # Identical
ts.plot(EuStockMarkets)  # One window

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons
detach("package:datasets", unload = TRUE)  # For base

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

# INSTALL AND LOAD PACKAGES ################################

# pacman must already be installed; then load contributed
# packages (including pacman) with pacman
pacman::p_load(pacman, rio, tidyverse)
# pacman: for loading/unloading packages
# rio: for importing data
# tidyverse: for so many reasons

# LOAD AND PREPARE DATA ####################################

# Save data to "df" (for "data frame")
# Rename outcome as "y" (if it helps)
# Specify outcome with df$y

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

# Calculate clusters
hc <- df %>%  # Get data
  dist %>%    # Compute distance/dissimilarity matrix
  hclust      # Compute hierarchical clusters

# Plot dendrogram
hc %>% plot(labels = df$state_code)

# Draw boxes around clusters
hc %>% rect.hclust(k = 2, border = "gray80")  # 2 boxes
hc %>% rect.hclust(k = 3, border = "gray60")  # 3 boxes
hc %>% rect.hclust(k = 4, border = "gray40")  # 4 boxes

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L

