#install.packages("tidyverse")
#install.packages("readtext")
#install.packages("quantreg")
#install.packages("car")

library(quantreg)
library(tidyverse)
library(readxl)
library(dplyr)
library(readtext)
library(tibble)
library(car)

#First, I accessed the Census Bureau's voter particpation records, specifically
#"Table A-2. Reported Voting and Registration by Region, Educational Attainment 
#and Labor Force Status for the Population 18 and Over: November 1964 to 2016"
#The data needed from this is the voter participation rates every two years by 
#region.

#download.file("https://www2.census.gov/programs-surveys/cps/tables/time-series/voting-historical-time-series/a2.xlsx", 
#              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votepart_region.xlsx", mode="wb")
votepart_region <- read_excel("./votepart_region.xlsx")

#Now I have to clean this up and get the data that I actually want. I did this 
#probably not in the most efficient or sensical way, but it works.

votepart_regionT <- as.tibble(votepart_region)
colnames(votepart_regionT) <- c("Year","Northeast", "Midwest", "South", "West")
votepart_regionT <- votepart_regionT[9:29,1:5]

# ensure all values are numeric
votepart_regionT$Year<-as.numeric(votepart_regionT$Year)
votepart_regionT$Northeast<-as.numeric(votepart_regionT$Northeast)
votepart_regionT$Midwest<-as.numeric(votepart_regionT$Midwest)
votepart_regionT$South<-as.numeric(votepart_regionT$South)
votepart_regionT$West<-as.numeric(votepart_regionT$West)

#GSS Data found here http://www.thearda.com/quickstats/qs_105_t.asp
#Need to exclude data for non-elections years and years within my timeframe
gss_data <- read_excel(".\\gss_service_att.xlsx")
gss_data <- gss_data[1:29,]
gss_data_even <- subset(gss_data, Year%%2==0)

#combine all into one df
combined_df <- dplyr::right_join(gss_data_even, votepart_regionT, by="Year")

#Separate the midterms and the presidential election years for separate analysis
midterms <- combined_df[ c(1,3,5,7,9,11,13,15,17,19,21), ]
presidential <- combined_df[ c(2,4,6,8,10,12,14,16,18,20),]

# produce appropriate plots


cormat <- round(cor(combined_df),2)
require(reshape2)
cormat <- melt(cormat)
head(cormat)


1975 - 1988
1988 - 2014

# Create new column for splitting the data
combined_df <- combined_df %>% mutate(period = ifelse(
  Year >=1994, "Period 2", "Period 1"))

#Plot for period 1 for the South
ggplot(data = combined_df %>% filter(year ==  "Year")) + 
  geom_point(aes(x=Never, y = South)) + geom_smooth(aes(x=Never, y = South))

# Plot data for period 2 for the south
ggplot(data = combined_df %>% filter(period ==  "Period 2")) + 
  geom_point(aes(x=Never, y = South)) + geom_smooth(aes(x=Never, y = South))

#plot for period 1 for the Northeast
ggplot(data = combined_df %>% filter(period ==  "Period 1")) + 
  geom_point(aes(x=Never, y = Northeast)) + geom_smooth(aes(x=Never, y = Northeast))

#plot for period 2 for the Northeast
ggplot(data = combined_df %>% filter(period ==  "Period 2")) + 
  geom_point(aes(x=Never, y = Northeast)) + geom_smooth(aes(x=Never, y = Northeast))

#plot for period 1 for the Midwest
ggplot(data = combined_df %>% filter(period ==  "Period 1")) + 
  geom_point(aes(x=Never, y = Midwest)) + geom_smooth(aes(x=Never, y = Midwest))

#plot for period 2 for the Midwest
ggplot(data = combined_df %>% filter(period ==  "Period 2")) + 
  geom_point(aes(x=Never, y = Midwest)) + geom_smooth(aes(x=Never, y = Midwest))

#plot for period 1 for the West
ggplot(data = combined_df %>% filter(period ==  "Period 1")) + 
  geom_point(aes(x=Never, y = West)) + geom_smooth(aes(x=Never, y = West))

#plot for period 2 for the West
ggplot(data = combined_df %>% filter(period ==  "Period 2")) + 
  geom_point(aes(x=Never, y = West)) + geom_smooth(aes(x=Never, y = West))



#plot for both periods for the South
south_both <- ggplot(data = combined_df) + 
  geom_point(aes(x=Never, y = South, color = period)) + geom_smooth(aes(x=Never, y = South)) + 
  title("The South, 1974 - 2014", xlab="Percent Never Attends Religious Services",
      ylab="Percent Voter Turnout")

#plot for both periods for the Northeast
ggplot(data = combined_df) + 
  geom_point(aes(x=Never, y = Northeast,  color = period)) + geom_smooth(aes(x=Never, y = Northeast))

#plot for both periods for the Midwest
ggplot(data = combined_df) + 
  geom_point(aes(x=Never, y = Midwest, color = period)) + geom_smooth(aes(x=Never, y = Midwest))

#plot for both periods for the West
ggplot(data = combined_df) + 
  geom_point(aes(x=Never, y = West, color = period)) + geom_smooth(aes(x=Never, y = West))



#Plot for presidential election years
ggplot(data = presidential) + 
  geom_point(aes(x=Never, y = Northeast,  color = period)) + geom_smooth(aes(x=Never, y = Northeast))


#Plot for midterm election years
ggplot(data = midterms) + 
  geom_point(aes(x=Never, y = Northeast,  color = period)) + geom_smooth(aes(x=Never, y = Northeast))


install.packages("xlsx")
library(xlsx)
write.xlsx(combined_df, "cC:\\Users\\brian\\Desktop\\Final_Project\\combined_df.xlsx")


ggplot(data = combined_df) + 
  geom_point(aes(x=Never, y = West), aes(scale_radius(range = c(1:3)))) +
  
  points(combined_df$lat, combined_df$long, cex=as.numeric(combined_df$Year)) +
                
  
  geom_smooth(aes(x=Never, y = West)) 
  


# produce appropriate plots - dot size changes per year
(ggplot(data = combined_df) 
  + geom_point(data=combined_df, aes(x=Never, y=West), aes(scale_radius(range=c(1:3)))) 
  + points(combined_df$Never, combined_df$West, cex=as.numeric(combined_df$Year)) 
  + geom_smooth(aes(x=Never, y=West)))


# Trying to get the title and axis labels right
ggplot(data = combined_df) + 
  geom_point(aes(x=Never, y = South, color = period)) + geom_smooth(aes(x=Never, y = South)) + 
  title("The South, 1974 - 2014", xlab="Percent Never Attends Religious Services",
        ylab="Percent Voter Turnout")



