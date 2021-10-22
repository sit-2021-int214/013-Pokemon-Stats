library(dplyr)
library(readr)
library(stringr)
library(assertive)

sat <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

# 1.How many observation of this dataset (before cleaning) ?
sat %>% glimpse()

# 2.Are there duplicate data sets ? (If have duplicate data, list the data that duplicate)
sat %>% duplicated() %>% table()
sat %>% filter(duplicated(sat))

# 3.How many distinct school in this dataset ? (Know after drop duplicate data)
sat <- sat %>% distinct()
sat %>% filter(duplicated(sat)) %>% count()

# 4.What is min, max, average, quartile of each part in SAT ?
sat$math_score <- sat$math_score %>% str_remove("s") %>% str_trim() %>% as.numeric()
sat$math_score <- replace(sat$math_score,is.na(sat$math_score), 0)
sat$math_score <- replace(sat$math_score, sat$math_score >= 800, 800)
sat$math_score <- replace(sat$math_score, sat$math_score <= 200, 200)

sat$reading_score <- sat$reading_score %>% str_remove("s") %>% str_trim() %>% as.numeric()
sat$reading_score <- replace(sat$reading_score,is.na(sat$reading_score), 0)
sat$reading_score <- replace(sat$reading_score, sat$reading_score >= 800, 800)
sat$reading_score <- replace(sat$reading_score, sat$reading_score <= 200, 200)

sat$writing_score <- sat$writing_score %>% str_remove("s") %>% str_trim() %>% as.numeric()
sat$writing_score <- replace(sat$writing_score,is.na(sat$writing_score), 0)
sat$writing_score <- replace(sat$writing_score, sat$writing_score >= 800, 800)
sat$writing_score <- replace(sat$writing_score, sat$writing_score <= 200, 200)

summary(sat$math_score)
summary(sat$reading_score)
summary(sat$writing_score)

# 5.What is min, max, average, quartile of total score in SAT ?
sat %>% mutate(total = sat$math_score+sat$reading_score+sat$writing_score) %>% select(total) %>% summary()

#6.Which school is get highest SAT score ?
sat %>% mutate(total = sat$math_score+sat$reading_score+sat$writing_score) %>%select(school_name,total) %>% arrange(desc(total)) %>% head(1)