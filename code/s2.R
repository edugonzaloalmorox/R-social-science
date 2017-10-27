# Code for session 2 - Quantitative Social Science in R 
# 18 October 2017
# @Edu Gonzalo Almorox (Economics - Newcastle University)
########################################################


## ---- message=FALSE, warning=FALSE, include=FALSE------------------------
library(tidyverse)

## ---- echo = TRUE, eval = FALSE------------------------------------------
## 
## # working directory
## setwd("/Users/my-file/my_document")

## ---- echo = TRUE, eval = FALSE------------------------------------------
## install.packages() # for installing packages

## ---- echo = TRUE, eval = FALSE------------------------------------------
## library() # for loading libraries

## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

# load data including working directory
my_df = read.csv("data/data_intro_r.csv",
                 sep = ",")

head(my_df)


## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

# load data including working directory
library(rio)
my_df_import = import("data/data_intro_r.csv")

head(my_df_import, 3)


## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

# load data including working directory

library(readr)
my_df_readr = read_csv("data/data_intro_r.csv")

head(my_df_readr)


## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

# load data including working directory

library(readxl)
my_excel = read_excel("data/r_intro.xlsx")


head(my_excel, 5)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

# name of the sheet 
library(readxl)
my_excel = read_excel("data/r_intro.xlsx", sheet = "thisisaverylongnameforasheet")

head(my_excel, 3)

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

# name of the sheet 
library(readxl)
my_excel = read_excel("data/r_intro.xlsx", sheet = 1)

head(my_excel, 2)

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

# rows
library(readxl)
my_excel_clean = read_excel("data/r_intro.xlsx", sheet = 1, cell_rows(10:15))

head(my_excel_clean, 3)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----
library(readxl)

# columns

my_excel_clean_cols = read_excel("data/r_intro.xlsx", sheet = 1, cell_cols("C:L"))

head(my_excel_clean_cols, 3)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----
library(readxl)

# range
my_excel_clean_range = read_excel("data/r_intro.xlsx", sheet = 1, range = "A11:M337")

head(my_excel_clean_range, 3)


## ---- echo = FALSE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

# range 

my_excel_2011= read_excel("data/r_intro.xlsx", sheet = 1, range = c("E11:H327"))

head(my_excel_2011)



## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

# what is a factor here?

library(readr)
my_data = read_csv("data/data_intro_r.csv")

my_data  = as.data.frame(my_data)

head(my_data, 7)


## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

glimpse(my_data)


## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

my_data$location.id = as.factor(my_data$location.id)

glimpse(my_data)


## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

# transform into a factor
my_data$location.region = as.factor(my_data$location.region)

# get level
levels(my_data$location.region)



## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(forcats) 

# transform into a factor
my_data$location.region = as.factor(my_data$location.region)

# get region levels
regions = levels(my_data$location.region)

fct_recode(regions, no_name = "Unspecified")



## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

table(my_data$location.region)



## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(forcats) 

# transform into a factor
my_data$regions.recoded = fct_recode(my_data$location.region, `No name` = "Unspecified")

head(my_data)

table(my_data$regions.recoded)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

library(stringr)

# transform and add the string

my_data$new_region = str_c("region", my_data$location.region, sep = "_")

# make it lower

my_data$new_region = tolower(my_data$new_region)

head(my_data$new_region)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

glimpse(my_data)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

library(stringr)

my_data$new_region2 = str_sub(my_data$new_region, 1, 7)

head(my_data$new_region2, 10)

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

library(stringr)

my_data$new_region2 = gsub("_", " ", my_data$new_region)

head(my_data$new_region2)



## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

my_data$region.east = str_detect(my_data$location.region, "East")

table(my_data$region.east)

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

my_data$region.east2 = as.factor(str_extract(my_data$location.region, "East"))

summary(my_data$region.east2)

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

dates <- c("02/27/92", "02/27/92", "01/14/92", "02/28/92", "02/01/92")
times <- c("23:03:20", "22:29:56", "01:03:30", "18:21:03", "16:56:26")
x <- data.frame(dates, times, dates_times = paste(dates, times))



## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----
library(lubridate)
str(x)

# transform to "date format" 

x$new_datetime = mdy_hms(x$dates_times)
str(x)

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----
library(lubridate)

# hours
x$hour = hour(x$new_datetime)


# week-day to "date format" 
x$weekday = wday(x$new_datetime, label = TRUE)

x


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----
library(lubridate)

summary(x$new_datetime) 


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

library(rio)
library(dplyr)
        
my_data = import("data/data_intro_r.csv")

my_data = my_data %>% mutate(unemp_level = ifelse(jsa.fem < 30, "below", 
                                  ifelse(jsa.fem >= 30 & jsa.fem < 35, "medium",
                                  ifelse(jsa.fem >=35, "high", "other"))))

head(my_data,4)

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

library(dplyr)
        
regions_south = c("South East", "South West")

my_data_south = my_data %>%
  filter(location.region %in% regions_south) %>%
  arrange(date)

head(my_data_south,7)

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

sum_jsa = my_data %>%
  group_by(location.region) %>%
  summarise(mean.jsa = mean(jsa.fem),
            min.jsa = min(jsa.fem),
            max.jsa = max(jsa.fem)) 

sum_jsa

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

sum_jsa = my_data %>%
  group_by(location.region) %>%
  summarise(mean.jsa = mean(jsa.fem),
            min.jsa = min(jsa.fem),
            max.jsa = max(jsa.fem)) %>%
  filter(location.region != "Unspecified")

sum_jsa

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

glimpse(my_data)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

my_data =  my_data %>%  
  mutate_at(vars(location.region, unemp_level), funs(as.factor)) %>%
  mutate_at(vars(date), funs(as.Date))


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

glimpse(my_data)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

library(dplyr)
library(rio)

d1  = import("data/pop_link.csv")

d2 = import("data/claim_link.csv")



## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

glimpse(d1)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

glimpse(d2)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

new_data = left_join(d1, d2, by = c("Local Authority"))

glimpse(new_data)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

new_data = left_join(d1, d2,
                     by = c("Local Authority" = "Local Authority", 
                                    "oslaua" = "code_la"))

glimpse(new_data)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

library(rio)
library(tidyr)
library(dplyr)

d1  = import("data/pop_link.csv")

head(d1)


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

d1 %>% gather(age, number, `All Ages`: `Aged 85+`)



## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

 d1 %>% gather(age, number, `All Ages`: `Aged 85+`) %>%
  arrange(`Local Authority`)




## ---- echo = FALSE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

new_df_long = new_data %>% 
  select(oslaua, `2014`:`2017`) %>% 
  gather(year, claimants, `2014`:`2017`)

d1_long = d1 %>% gather(age, number, `All Ages`: `Aged 85+`) %>%
  arrange(`Local Authority`)

exercise = left_join(d1_long, new_df_long, by = "oslaua")

head(exercise)




## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

new_df_long = new_data %>% 
  select(oslaua, `2014`:`2017`) %>% 
  gather(year, claimants, `2014`:`2017`)

d1_long = d1 %>% gather(age, number, `All Ages`: `Aged 85+`) %>%
  arrange(`Local Authority`)

exercise = left_join(d1_long, new_df_long, by = "oslaua")

head(exercise)



