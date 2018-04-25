



download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/580/table04a.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2016.xls", mode="wb")
votes_by_state_2016 <- read_excel("votes_by_state_2016.xls")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/577/table04a.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2014.xls", mode="wb")
votes_by_state_2014 <- read_excel("votes_by_state_2014.xls")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/568/table04a.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2012.xls", mode="wb")
votes_by_state_2012 <- read_excel("votes_by_state_2012.xls")


download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/voting-registration-2010-election/table4a_2010.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2010.xls", mode="wb")
votes_by_state_2010 <- read_excel("votes_by_state_2010.xls")


download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/562-rv/table-04a.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2008.xls", mode="wb")
votes_by_state_2008 <- read_excel("votes_by_state_2008.xls")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/557/tab04a.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2006.xls", mode="wb")
votes_by_state_2006 <- read_excel("votes_by_state_2006.xls")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/556/tab04c.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2004.xls", mode="wb")
votes_by_state_2004 <- read_excel("votes_by_state_2004.xls")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/552/tab04c.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2002.xls", mode="wb")
votes_by_state_2002 <- read_excel("votes_by_state_2002.xls")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/542/tab04c.xls", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_2000.xls", mode="wb")
votes_by_state_2000 <- read_excel("votes_by_state_2000.xls")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/523-rv/tab03.txt", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_1998.txt", mode="wb")
votes_by_state_1998 <- read_t("votes_by_state_1998.xls")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/523-rv/tab03.txt", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_1998.txt", mode="wb")
votes_by_state_1998 <- readtext("votes_by_state_1998.txt")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/504/tab4c.txt", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_1996.txt", mode="wb")
votes_by_state_1996 <- readtext("votes_by_state_1996.txt")

download.file("https://www2.census.gov/programs-surveys/cps/tables/p20/ppl-25-rv/tab02.txt", 
              destfile = "C:\\Users\\brian\\Desktop\\Final_Project\\votes_by_state_1994.txt", mode="wb")
votes_by_state_1994 <- readtext("votes_by_state_1994.txt")


https://www2.census.gov/programs-surveys/cps/tables/p20/ppl-25-rv/tab02.txt






anes <- read.dta13(file="C:\\Users\\brian\\Desktop\\Final_Project\\anes_timeseries_cdf_dta\\anes_timeseries_cdf_stata12.dta")
service_frquency <- select(anes, VCF0130)
service_frequency2 <- select(anes, VCF0130a)
#of the 55,674 entries polled in 1990, only 7,536 respondents said they do not 
#attend church ever. 33,653 of the entries were NA. Thus, 14,485 said they 
#attend services at least once a year. 

serv_freq_52_to_68 <- select(anes, VCF0131)
#Of 55,674 entries, 774 said they never attend. 10,662 said they attended to 
#to some degree. 179 said they had no religious preference.