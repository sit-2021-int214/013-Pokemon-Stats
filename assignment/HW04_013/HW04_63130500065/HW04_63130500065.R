library(dplyr)
library(readr)
library(stringr)
library(assertive)
library(ggplot2)
library(stringr)
library(forcats)

cs270 <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

#3.1
cs270 %>% glimpse()

#3.2
cs270 %>% group_by(Type) %>% select(Rating) %>% summarise(avg = mean(Rating, na.rm = TRUE)) %>% arrange(desc(avg))

#3.3
cs270 %>% group_by(Book_title) %>% select(Price) %>% summarise(max_price = max(Price))%>% arrange(desc(max_price)) %>% head(1)
cs270 %>% group_by(Book_title) %>% select(Price) %>% summarise(min_price = min(Price))%>% arrange((min_price)) %>% head(1)

#3.4
cs270$Rating %>% mean()
cs270$Rating %>% max()
cs270$Rating %>% min()

#3.5
cs270 %>% select(Type) %>% table()

#3.6
str_subset(cs270$Book_title, "Programming")

## ggplot
#1
ggplot(cs270, aes(Rating, fill = cs270$Type)) + geom_histogram(binwidth = 0.05) + ggtitle("Count of rating")

#2
ggplot(cs270 ,aes(Price, Rating)) + geom_point()+  ggtitle("Count of rating")








