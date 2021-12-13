# Hypothesis Testing
##Total ของโปเกม่อนทั้งหมดมีค่าเฉลี่ยของ Total อยู่ใกล้เคียงกัน ถ้าเราสุ่มตัวอย่างโปเกมอนมา 100 ตัว 
##ค่าเฉลี่ยของโปเกมอนจะยังใกล้เคียงกับค่าเฉลี่ยดั้งเดิม ค่าความเชื่อมั่นคือ 95 เปอร์เซ็นต์


## Step 0: Install Library && Import CSV
```
library("dplyr")
library("readr")

data <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/013-Pokemon-Stats/main/
```

## Step 1: สุ่มกลุ่มตัวอย่าง
```
data_sample <- data %>% sample_n(100)
```

## Step 2: Find Point Estimation
```
n <- 100
alpha <- 0.05
mean <- mean(data_sample$Total)
sd <- sd(data_sample$Total)
mue0 <- mean(data$Total)
```

## Step 3: Find T-Distribution
```
t <- (mean-mue0)/(sd*(sqrt(n)))	
```
# Result
```
-0.015270113580662
```


## Step 4: Find Proportion
```
pt <- pt(t,n-1)
```
# Result
```
0.493923708495712
```

## Step 5: Check Rejection
```
if(pt <= alpha){
  print('reject H0')
}else{
  print('not reject H0')
}
```
# Result
```
Not reject H0
```

## Step 6: Interval Estimation
```
seom <- sd/sqrt(n)
margin <- 1.96*seom

upper <- mean+margin
lower <- mean-margin
```
# Result
```
Point estimate: 10.6876694741126
Margin of error: 20.9478321692607

Upper: 443.227832169261
Lower: 401.332167830739
```
