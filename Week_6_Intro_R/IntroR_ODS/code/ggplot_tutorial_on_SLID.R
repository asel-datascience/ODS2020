#LOAD DATASET ####
install.packages("car")
library(car)
# using Survey Of Labour And Income Dynamics subset
data(SLID)
g<-ggplot(data=SLID)
g
#aesthetic  - background and labels
g<-ggplot(data=SLID,
          aes(x=education,y=wages))
g
# geometry - discrete points ####
g<-ggplot(data=SLID,
          aes(x=education,y=wages))+ geom_point()
g
#geometry - smooth line
g<-ggplot(data=SLID,
          aes(x=education,y=wages))+ geom_smooth()
g
#geometry - combining points with a smooth line
g<-ggplot(data=SLID,
          aes(x=education,y=wages))+ geom_smooth()
g<-g+geom_point()
g
# aesthetic - adding colors

g <- ggplot(data=SLID) 
g <- g + geom_point(
          aes(x=education,y=wages,colour=sex))
g

# geometry with colors

g <- ggplot(data=SLID)
g <- g + geom_smooth(
  aes(x=education,y=wages,colour=sex))
g

# adding facets ####

g <- ggplot(data=SLID, aes(x=education,y=wages)) + geom_smooth() 
g <- g + facet_wrap(~sex) 
g
#Exercise:
  # – try other variables
  #– try facet_grid(var1 ~ var2)

# adding statistics ####

g = ggplot( 
  data.frame(country=c("UK","USA"),population=c(66.02,325.7))) + 
  geom_bar(aes(x=country,y=population),stat="identity")
g

g = ggplot(data=SLID) 
g = g + geom_bar(aes(x=sex,y=wages), 
                 stat="summary", fun.y = "mean") 
g
# • Exercises:
#   – try other statistics (mean, max, count)
# – try a adding group/fill/colour to aesthetic

g
