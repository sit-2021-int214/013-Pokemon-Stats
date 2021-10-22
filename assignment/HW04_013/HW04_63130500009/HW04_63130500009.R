library(dplyr)
library(readr)      
library(stringr)    
library(assertive)
library(ggplot2)

SuperStore_sales <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
#1.
SuperStore_sales %>% glimpse();
#2.
SuperStore_sales %>% filter(between(format(as.Date(Order.Date,format = "%d/%m/%Y"),"%Y"),2015,2019))

SuperStore_sales %>% summary()

SuperStore_sales %>% count(Region)

SuperStore_sales %>% distinct(City)
SuperStore_sales %>% distinct(Country)

SuperStore_sales %>% arrange(desc(Sales)) %>% select(Row.ID,Sales) 

SuperStore_sales %>% count(Segment)

#3.
SuperStore_sales %>% ggplot(aes(Sub.Category))+geom_bar()

SuperStore_sales %>% ggplot(aes(x=Sales,y=count(Region)))+geom_point()

#4.
install.packages("tidyverse")
install.packages("forcats")

library(tidyverse)
library(forcats)

ColorCats <- c("Red","Green","Blue","White","Orange")
NumCats <- c(2,10,5,1,7)
Age <- c(2,3,2,7,5)

Cats <-    tribble(
  ~ColorCats, ~number, ~age,
  "Red",       2,  2,
  "Green",     10, 3,
  "Blue",       5, 2,
  "White",      1, 7,
  "Orange",     7, 5
)
Cats$ColorCats <- factor(Cats$ColorCats)
fct_reorder(Cats$ColorCats,Cats$number,min)




