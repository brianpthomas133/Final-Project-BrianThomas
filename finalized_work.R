install.packages("readstata13")
install.packages("tidyverse")
install.packages("readtext")

library(tidyverse)
library(readxl)
library(dplyr)
library(readtext)
library(tibble)

#Next, I accessed the Census Bureau's voter particpation records, specifically
#"Table A-2. Reported Voting and Registration by Region, Educational Attainment 
#and Labor Force Status for the Population 18 and Over: November 1964 to 2016"
#The data needed from this is the voter participation rates every two years by 
#region.

download.file("https://www2.census.gov/programs-surveys/cps/tables/time-series/voting-historical-time-series/a2.xlsx", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votepart_region.xlsx", mode="wb")
votepart_region <- read_excel("votepart_region.xlsx")

#Now I have to clean this up and get the data that I actually want. I did this 
#probably not in the most efficient or sensical way, but it works.

votepart_regionT <- as.tibble(votepart_region)

colnames(votepart_regionT) <- c("a","b", "c", "d", "e")

regional_part_years <- votepart_regionT[,1:5]
region_part_years <- regional_part_years[8:29,]

colnames(region_part_years) <- c("Year","Northeast", "Midwest", "South", "West")



#GSS Data found here http://www.thearda.com/quickstats/qs_105_t.asp

gss_data <- read_excel("C:\\Users\\brian\\Desktop\\Final_Project\\gss_service_att.xlsx")
service_att <- gss_data[1:29]
gss_data_even <- subset(gss_data, Year%2==0)


#Need to exclude data for non-elections years and years within my timeframe.

gss_data_even <- filter(gss_data, "year" %in% c(12, 15, 17, 19, 21, 25, 27, 29, 30))

sapply(gss_data, typeof)

transform(region_part_years, Year = as.numeric(Year),
          Northeast = as.numeric(Northeast),
          Midwest = as.numeric(Midwest),
          South = as.numeric(South),
          West = as.numeric(West))

transform(gss_data, Year = as.numeric(Year))

combined_df <- dplyr::left_join(gss_data, region_part_years, by="Year")



as.numeric()

ggplot(gss_data, aes())


ggplot(region_part_years, aes(year, northeast)) +
  geom_quantile()


ggplot(region_part_years, aes(Year), stat="Count") +
  geom_histogram(binwidth = 1)



install.packages("quantreg")
library(quantreg)





