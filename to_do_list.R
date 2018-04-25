#Things I need to do:
  
#  Parse the data by year and region together to have a consistent time series
  #probably scatterplot with a trend line per year
  #then a regression of the total numbers of people voting over time as a 
  #percentage of the pop, and percentage of registered voters

  #then i need to do this in relation to religiosity
  #basically do one thing for religiosity over time, and another for voter 
  #participation over time
  #then combine these into a graph that shows religiosity and voter 
  #participation over time.


#will need a loop to fetch the files from online, aaaaaalso need to do something
#about the file conversion for anes

        #HOW DO I DO LOOPS


https://www2.census.gov/programs-surveys/cps/tables/p20/580/table03.xls

https://www2.census.gov/programs-surveys/cps/tables/p20/577/table03.xls

https://www2.census.gov/programs-surveys/cps/tables/p20/568/table03.xls

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/580/table03.xls", 
                                 destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\voter_data_2016.xls")

read_excel("voter_data_2016.xls")

library(readxl)
setwd("C:\\Users\\brian\\Desktop\\Final_Project")



download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/580/table04a.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2016.xls", mode="wb")
votes_by_state_2016 <- read_excel("votes_by_state_2016.xls")
