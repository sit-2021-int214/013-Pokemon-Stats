#import data
data <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/013-Pokemon-Stats/main/pokemon.csv")

#Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)

#Data Exploration
data %>% View()
data %>% glimpse()

#Data Cleaning and Dta transformation
data <- data %>% filter(HP > 1) #Delete data HP = 1
data %>% summary()
count(data)
data %>% arrange(desc(HP))
data <- data %>% filter(Total != 1125) #Delete data Total = 1125
names(data)[6] <- "Special_attack" #rename
names(data)[7] <- "Special_defence" #rename

#Data Analysis with Descriptive Statics
data$Attack %>% mean() # mean = 80.42474

data %>% select(Name,Special_attack)  %>% filter(Special_attack > 100) # 183 ROWS

maxSpecialATK <- data$Special_attack %>% max() # 194
maxSpecialDEF <- data$Special_defence %>% max() # 230
maxSpecialATK - maxSpecialDEF # -36 Special DEF WIN

data$Total %>% max() #780
data$Total %>% min() #175
data$Total %>% mean() #438.8523
data$Total %>% quantile(0.75) #515


data %>% arrange(HP) %>% head(25) %>% mutate(Allatk = Attack+Special_attack) %>% select(Name,HP,Allatk) %>%glimpse() #25 ROWS
data %>% arrange(desc(HP)) %>% head(25) %>% select(Name,HP) %>% glimpse() #25 ROWS
data %>% arrange(HP) %>% head(25) %>% mutate(Allatk = Attack+Special_attack) %>% select(Name,HP,Allatk) %>%  filter(Allatk > 126) %>% glimpse() #4 ROWS

data %>% arrange(desc(Speed)) %>% head(10) %>% filter(Sp_defence < mean(Sp_defence)) %>% select(Name) #Regieleki, Ninjask, Pheromosa, Deoxys, Mega Deoxys

data %>% filter(Speed > mean(Attack)) %>% arrange(desc(Speed)) %>% head(1) %>% select(Name) #Regieleki

max(data$Attack) - mean(data$Speed) #121.1923

