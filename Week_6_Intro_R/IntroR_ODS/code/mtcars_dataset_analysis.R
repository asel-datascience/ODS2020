# DATASET ####

install.packages("datasets") #installing datasets package in R
library(datasets)
#exploring dataset mtcars, its dimensions, number/count of values
head(mtcars)
tail(mtcars)
head(mtcars,25)
nrow(mtcars)
ncol(mtcars)
#metrics and dimensions of the dataset
str(mtcars)
summary(mtcars)
#unique and missing values
unique(mtcars$cyl)
is.na(mtcars)

# DATA VISUALISATION ####
hist(mtcars$mpg) #histogram  of the mpg column data
hist(mtcars$hp)
#recalculating metrics from mpg(miles per gallon) into kml(km per l)

mtcars2 <- mtcars
mtcars2$disp_l <- mtcars$mpg/61.024
mtcars2$kml <- 235/mtcars$mpg
hist(mtcars2$disp_l)

#boxplot graphics

boxplot(mtcars)
boxplot(mtcars2$disp_l, mtcars2$kml)
#adding legend and labels
boxplot(mtcars2$kml, main = "mtcars dataset", xlab = "Comsumption per 100km", ylab = "Liters")

#correlation

install.packages("corrplot")
library(corrplot)
#cor(x, method = "pearson", use = "complete.obs")
cor(mtcars)

#plotting correlation

res <- cor(mtcars)
round(res, 2) 
corrplot(res, type = "upper", order = "hclust", 
            tl.col = "black", tl.srt = 25)

# heatmap via corrplot library

 col<- colorRampPalette(c("blue", "white", "red"))(20)
heatmap(x = res, col = col, symm = TRUE)

#bivariate plots

require(graphics)
pairs(mtcars2, main = "mtcars2 data", gap = 1/4)
coplot(kml ~ disp_l | as.factor(cyl), data = mtcars2,
       panel = panel.smooth, rows = 1)
## possibly more meaningful, e.g., for summary() or bivariate plots:
mtcars2 <- within(mtcars2, {
  vs <- factor(vs, labels = c("V", "S"))
  am <- factor(am, labels = c("automatic", "manual"))
  cyl  <- ordered(cyl)
  gear <- ordered(gear)
  carb <- ordered(carb)
})
summary(mtcars2)

#Library Performance Analytics


install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
chart.Correlation(mtcars, histogram=TRUE, pch=19)
mtcars_small <- mtcars[,1:4]
chart.Correlation(mtcars_small, histogram=TRUE, pch=19)


