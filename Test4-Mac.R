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


#Section 3: Box-and-whisker plot _____ / 10 points  ---- 

#Using the “team_statistics.Rdata”
#3. For teams in the Big 10 Conference, 
#generate a box-and-whisker plot for rushing yards. (6 points) ---- 

unique(ts$Conference)

ggplot(ts[ts$Conference =='Big Ten Conference',], aes(x =Team, y =Rush.Yard)) +
  geom_boxplot() +
  theme(axis.text.x=element_text(angle=90, size = 10)) 


#a. Make the panel background dark blue 
#and the fill of the box-and-whiskers bright yellow (2 points) ----


ggplot(ts[ts$Conference =='Big Ten Conference',], aes(x =Team, y =Rush.Yard)) +
  geom_boxplot(fill = 'yellow', outlier.color = 'yellow') +
  theme(axis.text.x=element_text(angle=90, size = 10), 
        panel.background = element_rect(fill='navy')) 

#b. Using this subset of data, tell me which team had the most rushing yards, on average? (2 points) ----
#Minnesota has the most rushing yards, on average. ---- 

#Section 4: Heat Map _____ / 8 points ---- 
load('football_stats.Rdata')
#4. For teams in the Southeastern conference, ----
#generate a heat map with ‘ggplot’ showing each team’s ---- 
#performance for each statistical variable. (6 points) ---- 

names(football.stats)
unique(football.stats$Conference)
se <- football.stats[football.stats$Conference =='Southeastern Conference',]
se
  
ggplot(se, aes(variable, Team)) +
  geom_tile(aes(fill = stat)) + 
  theme(axis.text.x=element_text(angle=90, size = 10))
#c. Plot the log-10 transformed values for the color scale. (2 points) ---- 
ggplot(se, aes(variable, Team)) +
  geom_tile(aes(fill = log10(stat))) + 
  theme(axis.text.x=element_text(angle=90, size = 10)) 
 
#Section 5: Mapping _____ / 20 points ----- 
#Using the “sec_stad.Rdata”
#5. Generate a ‘toner’ map figure showing the central and southeastern United States. (5 points) -----

library(ggmap)
library(osmdata)

names(sec_stad)
sec_stad$State
lonmin <-min(sec_stad[sec_stad$State =='TX',8])
lonmin
lonmax <- max(sec_stad[sec_stad$State,8])
lonmax
latmin <- min(sec_stad[sec_stad$State,9])
latmin
latmax <- max(sec_stad[sec_stad$State,9])
latmax 

bb <- c(left=lonmin -1, bottom=latmin-1, right=lonmax+1, top=latmax+1)

CSEUSA <- get_stamenmap(bbox = bb, zoom = 5, map = 'toner-lite')
CSEUSA
map1 <- ggmap(CSEUSA) 
ggsave('map1.png')


#6. Generate a second ‘toner’ map figure showing the central and southeastern United States, ----
#plus the geographic location of all the SEC stadiums (5 points). ---- 

map2 <- ggmap(CSEUSA) +
  geom_point(data =sec_stad, aes(x =lng, y=lat))
ggsave('map2.png')

#7. Generate a third ‘toner’ map figure showing the geographic location of all the SEC stadiums, ---- 
#this time represent these locations using the following aesthetics: ---- 
#d. Size of the points scale with the ‘Capacity’ of each stadium (1 points) ----
#e. The colors of the points show degree of gradation in ‘Capacity’ among stadiums (3 points)
map3 <- ggmap(CSEUSA) +
  geom_point(data =sec_stad, aes(x =lng, y=lat, size = Capacity, colour =Capacity))
ggsave('map3.png')
#8. Export and save these three maps as “.png” files. ----
#Please include them when you upload to Moodle (or email) your exam. ----
#(6 points total; i.e., 2 points per map file) ---- 
#See above after each map, also see attached '.png' files!! ---- 
 ?ggsave






