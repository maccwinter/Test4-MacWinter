#Test 4 Matthew Winter 

load('sec_stad.Rdata')
#1. Generate a bar plot showing the capacity of each football stadium ----

names(sec_stad)
library(ggplot2)

unique(sec_stad$Capacity)
class(sec_stad$Capacity)


ggplot(sec_stad) +
  geom_bar(aes(x=Name, y=Capacity), position = 'dodge', stat = 'identity') +
  theme(axis.text.x = element_text(size=2))

#a. Flip the axis so that the stadium names are ---- 
#arranged along the left side of the plot and the values are on the bottom of the plot

ggplot(sec_stad) +
  geom_bar(aes(x=Name, y=Capacity), position = 'dodge', stat = 'identity') +
  coord_flip() +
  theme(axis.text.y =element_text(size=5))
  
#b. Set the x-axis text to be a 90-degree angle. (2 points)

ggplot(sec_stad) +
  geom_bar(aes(x=Name, y=Capacity), position = 'dodge', stat = 'identity') +
  coord_flip() +
  theme(axis.text.x = element_text(angle=90, size = 10), axis.text.y=element_text(size=5))
 
  
  


