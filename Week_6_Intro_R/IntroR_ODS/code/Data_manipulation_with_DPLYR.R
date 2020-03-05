# LOAD PACKAGES ####
## this tutorial is taken from the "R for Data Science" online book https://r4ds.had.co.nz
install.packages("tidyverse")
library("dplyr")
install.packages("dbplyr")
install.packages("nycflights13")
library(nycflights13)
flights

#SELECT ####
select(flights,year,month,day) #select columns year, month and day 
select(flights,year:day)
select(flights,-(year:day))
#FILTERING ####
jan1<-filter(flights,month==1)  #january flights
nov_dec<-filter(flights,month %in% c(11,12)) # november, december flights
filter(flights,!(arr_delay>120|dep_delay>120))
filter(flights,arr_delay<=120,dep_delay<=120)

#REORDERING and RENAMING####

arrange(flights,year,month,day)
arrange(flights,desc(arr_delay))
rename(flights,tail_num=tailnum)

# USING MUTATE and SUMMARIZE ####

flights_sml<-select(flights, year:day, ends_with("delay"),
                    distance, air_time)
mutate(flights_sml, gain=arr_delay-dep_delay,
       speed=distance/air_time*60)
by_dest<-group_by(flights, dest) #note group_by method similar to the Python one
delay<-summarise(by_dest,
                 count=n(),
                 dist=mean(distance,na.rm=TRUE),
                 delay=mean(arr_delay,na.rm=TRUE))
delay<-filter (delays,count>20,dest!="HNL")
ggplot(data=delay,mapping=aes(x=dist, y=delay))+
  geom_point(aes(size=count),alpha=1/3)+
  geom_smooth(se=FALSE)
