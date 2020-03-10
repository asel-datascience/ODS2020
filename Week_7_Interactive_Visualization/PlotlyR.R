install.packages("plotly")
library(plotly)

Sys.setenv("plotly_username"="Altasela")
Sys.setenv("plotly_api_key"="RBRzWk8Y3Dc5Byd7cqqr")

install.packages("datasets")
# 3D visualization ####
?mtcars
mtcars$am[which(mtcars$am == 0)] <- 'Automatic'
mtcars$am[which(mtcars$am == 1)] <- 'Manual'
mtcars$am <- as.factor(mtcars$am)

fig <- plot_ly(mtcars, x = ~wt, y = ~hp, z = ~qsec, color = ~am, colors = c('#BF382A', '#0C4B8E'))
fig <- fig %>% add_markers()
fig <- fig %>% layout(scene = list(xaxis = list(title = 'Weight'),
                                   yaxis = list(title = 'Gross horsepower'),
                                   zaxis = list(title = '1/4 mile time')))

api_create(fig, filename = "3D-mtcars")
fig
# Diamonds ####
set.seed(100)
d <- diamonds[sample(nrow(diamonds), 1000), ]

p <- ggplot(data = d, aes(x = carat, y = price)) +
  geom_point(aes(text = paste("Clarity:", clarity)), size = 4) +
  geom_smooth(aes(colour = cut, fill = cut)) + facet_wrap(~ cut)

p <- ggplotly(p)
api_create(p, filename = "Diamonds_ggplot")
p
# Volcano Heatmap ####
?volcano
v<-plot_ly(z=~volcano,type="heatmap")

api_create(v, filename = "Volcano heatmap")

