# File:     Visualization_Colors.R
# Project:  IntroR_ODS

# LOAD DATA ################################################

x = c(24, 13, 7, 5, 3, 2)  # Sample data
barplot(x)                 # Default barplot

# COLORS IN R ##############################################

# Color names R has 657 color names for 502 unique colors,
# arranged alphabetically except for white, which is first
?colors
colors()  # Get list of color names

# Web page with R colors swatches, color names, hex codes,
# RBG codes (in 0-255 and 0.00-1.00), and R indez numbers;
# Browsable table on the page or in Google Sheets;
# downloadable as XLSX or PDF
browseURL("https://datalab.cc/rcolors")

# USE COLORS ###############################################

# Color names
barplot(x, col = "red3")  # red3
barplot(x, col = "slategray3")  # slategray3

# RGB triplets (0.00-1.00)
barplot(x, col = rgb(.80, 0, 0))      # red3
barplot(x, col = rgb(.62, .71, .80))  # slategray3

# RGB triplets (0-255)
barplot(x, col = rgb(205, 0, 0, max = 255))     # red3
barplot(x, col = rgb(159, 182, 205, max = 255)) # slategray3

# RGB hexcodes
barplot(x, col = "#CD0000")  # red3
barplot(x, col = "#9FB6CD")  # slategray3

# Index numbers
barplot(x, col = colors() [555])  # red3
barplot(x, col = colors() [602])  # slategray3

# MULTIPLE COLORS ##########################################
# Can specify several colors in a vector, which will cycle
barplot(x, col = c("red3", "slategray3"))
barplot(x, col = c("#9FB6CD", "#CD0000"))

# USING COLOR PALETTES #####################################

?palette  # Info on palettes
palette() # See current palette

barplot(x, col = 1:6)                # Use current palette
barplot(x, col = rainbow(6))         # Rainbow colors
barplot(x, col = heat.colors(6))     # Yellow through red
barplot(x, col = terrain.colors(6))  # Gray through green
barplot(x, col = topo.colors(6))     # Purple through tan
barplot(x, col = cm.colors(6))       # Pinks and blues

# CLEAN UP #################################################

# Clear environment
rm(list = ls()) 

# Clear plots
dev.off()  # But only if there IS a plot

# Clear console
cat("\014")  # ctrl+L


