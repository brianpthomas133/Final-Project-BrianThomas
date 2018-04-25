setwd(C:\\Documents\\School 2017-2018\\Final Project)
download.packages("foreign")
library(foreign)
library(tidyverse)
help(package=foreign)
read.dta(file="C:\Documents\School 2017-2018\Final Project\anes_timeseries_cdf_dta\anes_timeseries_cdf.dta")
file.choose("C:\\Documents\\School 2017-2018\\Final Project\\anes_timeseries_cdf_dta\\anes_timeseries_cdf.dta")
dataset = read.dta(
  "C:\\Documents\\School 2017-2018\\Final Project\\anes_timeseries_cdf_dta\\anes_timeseries_cdf.dta")
read.dta(file="C:\\Users\\brian\\Desktop\\Final_Project\\anes_timeseries_cdf_dta\\anes_timeseries_cdf.dta")

install.packages("foreign")
library(tidyverse)
library(foreign)
anes <- read.dta13(file="C:\\Users\\brian\\Desktop\\Final_Project\\anes_timeseries_cdf_dta\\anes_timeseries_cdf_stata12.dta")

install.packages("readstata13")
library(readstata13)

summarize(anes)
count(anes)


this is the variable i need -> VCF0130

create.data.frame(VCF0130)

service_frquency <- select(anes, VCF0130)

service_frequency2 <- select(anes, VCF0130a)

anes_data2 <- read.csv("C:/Users/brian/Desktop/Final_Project/anes_timeseries_cdf_dta/anes_data2.csv", header=FALSE)

serv_freq3 <- select(anes, 820734)

serv_freq_52_to_68 <- select(anes, VCF0131)


anes_dataset <- 

anes_data2 <- read.csv("C:/Users/brian/Desktop/Final_Project/anes_timeseries_cdf_dta/anes_data2.csv", header=FALSE)
  
rename(anes_data2, year = V2)

library(dplyr)

VCF0112 <- Census_Region

library(readxl)
voting_and_reg_by_region_and_state <- read_excel("voting_and_reg_by_region_and_state.xls")

