# Code for session 1 - Quantitative Social Science in R 
# 18 October 2017
# @Edu Gonzalo Almorox (Economics - Newcastle University)
########################################################





## ---- message=FALSE, warning=FALSE, include=FALSE------------------------
library(tidyverse)

## ---- echo = TRUE, include = TRUE----------------------------------------
v = c(1,2,3,4)
v

## ---- echo = TRUE, include = TRUE----------------------------------------
z = c("Paul", "Sarah", "Joe")
z

## ---- echo = TRUE, include = TRUE----------------------------------------
class(v)

## ---- echo = TRUE, include = TRUE----------------------------------------
length(z)

## ---- echo = TRUE, include = TRUE----------------------------------------
typeof(z)

## ---- echo = TRUE, include = TRUE----------------------------------------

z1 = c(z, "friend1", "friend2")
z1

## ---- echo = TRUE, include = TRUE----------------------------------------

z2 = rep(z1, 2)
z2

z3 = rep(z1, each = 2)
z3

## ---- echo = TRUE, include = TRUE----------------------------------------

m<- matrix(1:6, nrow=2, ncol =3)
m

## ---- echo = TRUE, include = TRUE----------------------------------------
x <- 1:3
y <- 10:12

m1  = rbind(x,y)
m1


## ---- echo = TRUE, include = TRUE----------------------------------------

x <- list(1, "a", TRUE)

x


## ---- echo = TRUE, include = TRUE----------------------------------------
y = list(a = "Mary",
    b = 1:5,
    c = c("Male", "25", TRUE))

y

## ---- echo = FALSE, include = TRUE---------------------------------------

df = data.frame(Name = c("Mary", "John", "Tony"),
    AGE = c(12, 25, 20),
    GenDER = c("0", "1", "1"), 
    Region = c("North East", "North East", "East Midlands"), 
    `ID code`  = c("A-00345", "A-1243009", "A-0012456"),
    `Treated?` = c("yes", "no", "yes"))


df


## ---- echo = TRUE, include = TRUE----------------------------------------

library(janitor)


df_clean = clean_names(df)

df_clean


## ---- echo = TRUE, include = TRUE----------------------------------------

head(df_clean,1)


## ---- echo = TRUE, include = TRUE----------------------------------------

tail(df_clean,2)


## ---- echo = TRUE, include = TRUE, message = FALSE, warning = FALSE------

library(dplyr)
glimpse(df_clean)


## ---- echo = TRUE, include = TRUE, message = FALSE, warning = FALSE------

as_tibble(df)


## ---- echo = FALSE, include = TRUE, message = FALSE, warning = FALSE-----

id = rep(c(z, "Beth", "Mike", "Martha"), each = 5)

time = rep(1:5, 6)


friends = data.frame(id, time)

head(friends)


## ---- echo = TRUE, include = TRUE, message = FALSE, warning = FALSE------

id = rep(c(z, "Beth",
           "Mike",
           "Martha"), each = 5)

time = rep(1:5, 6)


friends = data.frame(id, time)

head(friends)


## ---- echo = TRUE, include = TRUE, message = FALSE, warning = FALSE------

id = rep(c(z, "Beth",
           "Mike",
           "Martha"), each = 5)

time = rep(1:5, 6)


friends = cbind(id, time)


head(friends)

# Data frame 

friends = as.data.frame(friends)
head(friends, 2)

