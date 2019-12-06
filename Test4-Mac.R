#Test 4 Matthew Winter 


#Section 1. Bar plot ____ / 8 points ----

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
  
#b. Set the x-axis text to be a 90-degree angle. (2 points) ---- 

ggplot(sec_stad) +
  geom_bar(aes(x=Name, y=Capacity), position = 'dodge', stat = 'identity') +
  coord_flip() +
  theme(axis.text.x = element_text(angle=90, size = 10), axis.text.y=element_text(size=5))
 
#Section 2. Multiple Points plot ____ / 5 points ---- 

load('team_statistics.Rdata')

#2. Select teams belonging to the Sun Belt Conference from the data set. ---- 
#Generate a point plot using ‘ggplot’ to illustrate if there is a relationship 
#between the number of passing yards and the number of rushing yard for each team.

library(plyr)
names(ts)
unique(ts$Conference)

sunbelt <- ts[ts$Conference == 'Sun Belt Conference',]

SBC <- ddply(.data=sunbelt, .variables = 'Team', function(x){
  t <- unique(x$Team)
  rlshp <- ggplot(data=sunbelt, aes(Pass.Yard,Rush.Yard)) +
    geom_point() +
    geom_smooth() +
    ggtitle(t)
  ggsave(filename= paste0(t,'.tiff'),plot=rlshp, width =4, height=3, units='in',
         dpi=600, compression = 'lzw') }, .progress ='text')
  



  
  


