#Test 4 Matthew Winter 

load('sec_stad.Rdata')
#1. Generate a bar plot showing the capacity of each football stadium 

names(sec_stad)
library(ggplot2)

unique(sec_stad$Capacity)
class(sec_stad$Capacity)


ggplot(sec_stad) +
  geom_bar(aes(x=Name, y=Capacity), position = 'stack', stat = 'identity'  ) 
