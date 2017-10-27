# Code for session 3 - Quantitative Social Science in R 
# 18 October 2017
# @Edu Gonzalo Almorox (Economics - Newcastle University)
########################################################


## ---- message=FALSE, warning=FALSE, include=FALSE------------------------
library(tidyverse)

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)
data(diamonds) # data from the package
ggplot(diamonds, aes(x=carat, y=price))

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## 
## library(ggplot2)
## 
## # data from the package
## data(diamonds)
## 
## # plot
## ggplot(diamonds,
##        aes(x=carat, y=price))

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)
data(diamonds) # data from the package
ggplot(diamonds, aes(x=carat, y=price)) + geom_point()

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## 
## library(ggplot2)
## 
## # data from the package
## data(diamonds)
## 
## # plot
## ggplot(diamonds,
##        aes(x=carat, y=price))
##       + geom_point()

## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----
library(tidyverse)
glimpse(diamonds)



## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)
data(diamonds) # data from the package
ggplot(diamonds, aes(x=carat, y=price, color = cut)) + geom_point()

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## 
## library(ggplot2)
## 
## # data from the package
## data(diamonds)
## 
## # plot
## ggplot(diamonds,
##        aes(x=carat,
##            y=price,
##            color = cut)) +
##        geom_point()

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)
data(diamonds) # data from the package
ggplot(diamonds, aes(x=carat, y=price, color = cut)) + geom_point() + geom_smooth()

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## 
## library(ggplot2)
## 
## # data from the package
## data(diamonds)
## 
## # plot
## ggplot(diamonds,
##        aes(x=carat, y=price, color = cut)) +
##        geom_point() +
##        geom_smooth()

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)

ggplot(diamonds, aes(x=carat, y=price)) + geom_point(aes(color=cut)) + geom_smooth() 

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## 
## library(ggplot2)
## 
## # plot
## ggplot(diamonds,
##        aes(x=carat,
##            y=price)) +
##   geom_point(aes(color=cut)) +
##   geom_smooth()

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)

ggplot(diamonds, aes(x=carat, y=price)) + 
  geom_point(aes(color=cut), alpha = 0.5) +
  labs(title="My beautiful plot", x="The Carat", y="The Price", caption = "www.mydatasource.com") +
  geom_smooth() 

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## 
## library(ggplot2)
## 
## # plot
## ggplot(diamonds, aes(x=carat,
##                      y=price)) +
##   geom_point(aes(color=cut),
##              alpha = 0.5) +
##   labs(title="My beautiful plot",
##        x="The Carat",
##        y="The Price",
##        caption = "www.mydatasource.com") +
##   geom_smooth()

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)

g <- ggplot(diamonds, aes(cut))

g + geom_bar()
 

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## library(ggplot2)
## 
## g <- ggplot(diamonds, aes(cut))
## 
## g + geom_bar()
## 

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)

g <- ggplot(diamonds, aes(cut))

g + geom_bar(aes(fill = color))
 

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## library(ggplot2)
## 
## g <- ggplot(diamonds, aes(cut))
## 
## g + geom_bar(aes(fill = color))
## 

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)

g <- ggplot(diamonds, aes(cut))

g + geom_bar(aes(fill = color)) +
 coord_flip() +
   theme(legend.position = "top")
 

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## library(ggplot2)
## 
## g <- ggplot(diamonds, aes(cut))
## 
## g + geom_bar(aes(fill = color)) +
## coord_flip() +
##    theme(legend.position = "top")
## 

## ---- echo = TRUE, eval = FALSE, inlcude = FALSE, warning = FALSE, message = FALSE----
## 
## g <- ggplot(diamonds, aes(cut))
## 
##  g + geom_bar()  +
##    coord_flip() +
##    theme(legend.position = "top") +
##    facet_grid(clarity~color)
## 
## 

## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

library(ggplot2)

g <- ggplot(diamonds, aes(cut))

 g + geom_bar()  + 
   coord_flip() +
   theme(legend.position = "top") +
   facet_grid(clarity~color)


## ---- echo = FALSE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

 library(dplyr)
 library(ggplot2)
 library(janitor)
 library(rio)


df = import("data/edudata.dta")
 
 df = df %>% 
   mutate_at(vars(class1, class2, class3), funs(as.factor))
 
 
 # prepare data
 class1 =  df %>% group_by(class1, class2, class3) %>% tabyl(class1) %>% mutate(class = 1) %>% rename(category = class1)
 class2 =  df  %>% tabyl(class2) %>% mutate(class = 2) %>% rename(category = class2)
 class3 =  df %>% tabyl(class3) %>% mutate(class = 3) %>% rename(category = class3)
 
 # link datasets by row
 df_class = rbind(class1, class2, class3) %>% mutate(class = as.factor(class))
 
 
 # plot
 a = ggplot(df_class, aes(category, percent, fill = class)) + geom_bar(stat="identity")
 a



## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----

 library(dplyr)
 library(ggplot2)
 library(janitor)
 library(rio)

# format dta
mobi = import("data/edudata.dta")

glimpse(mobi)

 

## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----
# get frequencies each class
 df = mobi %>% 
   mutate_at(vars(class1, class2, class3), funs(as.factor))

 class1 =  df  %>% tabyl(class1) %>% mutate(class = 1) %>% rename(category = class1)
 class2 =  df  %>% tabyl(class2) %>% mutate(class = 2) %>% rename(category = class2)
 class3 =  df %>% tabyl(class3) %>% mutate(class = 3) %>% rename(category = class3)
 
 # link datasets by row
 df_linked = rbind(class1, class2, class3) %>% mutate(class = as.factor(class))
 
 glimpse(df_linked)

 

## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----
 # plot
 a = ggplot(df_linked,
    aes(category,
        percent,
        fill = class))+ 
  geom_bar(stat="identity")


## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----
 # plot
 a = ggplot(df_linked,
            aes(category,
                percent,
                fill = class)) +
  geom_bar(stat="identity")

 a


## ---- echo = FALSE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----
library(broom)

data(mtcars)
lmfit <- lm(mpg ~ wt+ qsec, mtcars)
summary(lmfit)


## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----
library(broom)

data(mtcars)
lmfit <- lm(mpg ~ wt+ qsec, mtcars)
lmfit_tidy = tidy(lmfit, conf.int = TRUE)

head(lmfit_tidy, 4)


## ---- echo = FALSE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

ggplot(lmfit_tidy, aes(estimate, term, color = term)) +
  geom_point() +
  geom_errorbarh(aes(xmin = conf.low, xmax = conf.high)) 


## ---- echo = TRUE, eval = TRUE, include = TRUE, warning = FALSE, message = FALSE----

g = ggplot(lmfit_tidy, aes(estimate, term, color = term)) +
  geom_point() +
  geom_errorbarh(aes(xmin = conf.low, xmax = conf.high)) 




## ---- echo = TRUE, eval = TRUE, inlcude = TRUE, warning = FALSE, message = FALSE----
library(broom)

lmfit_augmented = augment(lmfit)

head(lmfit_augmented, 4)


