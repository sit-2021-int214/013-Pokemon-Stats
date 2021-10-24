#Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)
library(tidyr)
library(ggplot2)

#install purrr
install.packages("purrr")
library(purrr)

#Import Data
prog_book <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

View(prog_book)

##Explore Dataset
#1.
prog_book %>% filter(Rating > mean(Rating)) %>% select(Book_title) %>% arrange(Book_title)
  
#sort(prog_book$Book_title, decreasing = FALSE)

#2.
prog_book %>% filter(Type == "Hardcover" & Reviews > mean(Reviews)) %>% count()

#3.
bookT <- prog_book %>% select(Book_title,)
count_title <- data.frame(bookT %>% map(function(x) str_length(x)))
count_title %>% filter(Book_title < 30) %>% count()

#4.
prog_book %>% filter(Number_Of_Pages == min(Number_Of_Pages) & Reviews < mean(Reviews)) %>% select(Type)

#5.
Hardcover <- prog_book %>% filter(Type == "Hardcover")
Paperback <- prog_book %>% filter(Type == "Paperback")

lowP_HC <- Hardcover %>% filter(Price == min(Price)) %>% select(Price)
highP_PB <- Paperback %>% filter(Price == max(Price)) %>% select(Price)

lowP_HC-highP_PB

#6.
prog_book %>% select(Rating, Reviews) %>% filter(Reviews < 100) %>% summarise(mean(Rating))

#7.
prog_book %>% filter(Type == "Kindle Edition") %>%  filter(Reviews == max(Reviews)) %>% summarise(Book_title, Reviews)

##Create Graph

## prog_book Dataset - Bar Chart

#Step 2-1: Save to object
type_plot <- ggplot(prog_book,aes(x=Type)) + geom_bar()
type_plot

#Step 2-2: Adding component
type_plot + ggtitle("Number of Programing Book Type") +
  xlab("Book Type") + ylab("Number of Books")

#2-2: Example 2: Scatter Plot

prog_book %>% filter(Number_Of_Pages < 3000) %>% ggplot(aes(x=Number_Of_Pages,y=Price))+geom_point() + ggtitle("Relation between Number of Pages and Price")
