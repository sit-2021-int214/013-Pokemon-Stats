# 63130500009
# Step 0
library(dplyr)
library(readr)      
library(stringr)    
library(assertive)  
SAT_Score <- read_csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/SAT_original.csv")

View(SAT_Score)
SAT_Score %>% glimpse() #5
SAT_Test3 <- SAT_Score
SAT_Test %>% glimpse()


#Test03
SAT_Test3 %>% filter(is.na(math_score)|is.na(reading_score)|is.na(writing_score))
SAT_Test3$math_score <- replace(SAT_Test3$math_score,SAT_Test3$math_score == 's', 200)
SAT_Test3$reading_score <- replace(SAT_Test3$reading_score,SAT_Test3$reading_score == 's', 200)
SAT_Test3$writing_score <- replace(SAT_Test3$writing_score,SAT_Test3$writing_score == 's', 200)
View(SAT_Test3)


#Test03
SAT_Test3 %>% glimpse()
SAT_Test3$math_score <- as.numeric(SAT_Test3$math_score)
SAT_Test3$reading_score <- as.numeric(SAT_Test3$reading_score)
SAT_Test3$writing_score <- as.numeric(SAT_Test3$writing_score)


#Test03
SAT_Test3 %>% duplicated() %>% table() #duplicate = 7
SAT_Test3 <-
  SAT_Test3 %>% distinct() #distinct = 478


#Test03
SAT_Test3 %>% filter(assert_all_are_in_closed_range(SAT_Test3$math_score, lower = 200, upper = 800))
SAT_Test3$math_score <- replace(SAT_Test3$math_score,SAT_Test3$math_score == 7735, 800)
SAT_Test3$math_score <- replace(SAT_Test3$math_score,SAT_Test3$math_score == 969, 800)
SAT_Test3$math_score <- replace(SAT_Test3$math_score,SAT_Test3$math_score == 39, 200)
SAT_Test3$math_score <- replace(SAT_Test3$math_score,SAT_Test3$math_score == 34, 200)


#Test03
SAT_Test3 %>% filter(assert_all_are_in_closed_range(SAT_Test3$reading_score, lower = 200, upper = 800))
SAT_Test3$reading_score <- replace(SAT_Test3$reading_score,SAT_Test3$reading_score == 37, 200)

#Test03
SAT_Test3 %>% filter(assert_all_are_in_closed_range(SAT_Test3$writing_score, lower = 200, upper = 800))
SAT_Test3$writing_score <- replace(SAT_Test3$writing_score,SAT_Test3$writing_score == 4030, 800)
SAT_Test3$writing_score <- replace(SAT_Test3$writing_score,SAT_Test3$writing_score == 35, 200)


SAT_Test3$writing_score %>% min()  #200
SAT_Test3$writing_score %>% max()  #800
SAT_Test3$writing_score %>% mean() #371.0377
SAT_Test3$writing_score %>% quantile() #    0%    25%    50%    75%   100% 
                                       #200.00 351.00 376.00 403.75 800.00 


min(SAT_Test3$reading_score)  # 200
max(SAT_Test3$reading_score)  # 679
mean(SAT_Test3$reading_score) # 376.1883
quantile(SAT_Test3$reading_score) #0%    25%    50%    75%   100% 
                                  #200.00 356.25 384.00 411.75 679.00 


min(SAT_Test3$math_score)  # 200
max(SAT_Test3$math_score)  # 800
mean(SAT_Test3$math_score) # 388.2531
quantile(SAT_Test3$math_score) # 0%    25%    50%    75%   100% 
                               #200.00 362.25 387.00 427.00 800.00 

SAT_Test3 %>% mutate(Total_Score = math_score+reading_score+writing_score ) %>% 
summarise(Total_min = min(Total_Score),Total_max = max(Total_Score),Total_mean = mean(Total_Score),Total_quantile = quantile(Total_Score))


  
  









