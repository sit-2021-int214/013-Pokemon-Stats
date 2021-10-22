# 013-Pokemon Stats
Datasets from: [pokemon.csv](https://www.kaggle.com/shubhamchambhare/pokemons-and-there-stats?select=pokemon.csv)

## Objective

## Process
0. Import datasets and libraries.
1. Define a question
2. Data Cleaning
3. List a film that is a episode
4. Find average rumtime of movie
5. Find a movies that is directed by Anthony Russo and Joe Russo
6. Find total, max, min, average of metascore.
7. Find total, max, min, average of imdb_vote.
8. Find total, max, min, average of imdb rating.
9. List a film that is rated at PG-13.
10. List a film that has runtime greater than 140 minutes.

## Our Steps

## 0. Import datasets and libraries.

### 0.1 Import dataset
Use read.csv to import dataset
```
#Import Data
data <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/013-Pokemon-Stats/main/pokemon.csv")
```

### 0.2 Import libraries
```
#Library
library(dplyr)
library(assertive)
library(readr)
library(stringr)
```

## 1. Data Exploration

Pokemon stat เป็น data ทีเก็บข้อมูลเกี่ยวกับ status ค่าต่างๆของตัว Pokemom ที่ใช้ในการเล่นเกมเท่านั้น 
ข้อมูลเป็นข้อมูลตัวอย่างของ Pokemom เป็นจำนวน 1043 ตัว มีด้วยกันทั้งหมด 8 column โดยชุดข้อมูลนี้ส่วนมากเก็บเป็น Int 
เพราะว่าสามารถนำข้อมูลมาใช้คำนวณและเก็บค่าเชิงสถิติในการใช้สำหรับการเล่นเกมได้

```
data %>% glimpse()
```

Result :

```
Rows: 1,043
Columns: 8
$ Name            <chr> "Bulbasaur", "Ivysaur", "Venusaur", "Mega Venusaur", "Charmander", "Charmeleon", "Charizard", "Mega Charizard", ~
$ Total           <int> 318, 405, 525, 625, 309, 405, 534, 634, 634, 314, 405, 530, 630, 195, 205, 395, 195, 205, 395, 495, 251, 349, 47~
$ HP              <int> 45, 60, 80, 80, 39, 58, 78, 78, 78, 44, 59, 79, 79, 45, 50, 60, 40, 45, 65, 65, 40, 63, 83, 83, 30, 30, 55, 75, ~
$ Attack          <int> 49, 62, 82, 100, 52, 64, 84, 130, 104, 48, 63, 83, 103, 30, 20, 45, 35, 25, 90, 150, 45, 60, 80, 80, 56, 56, 81,~
$ Defence         <int> 49, 63, 83, 123, 43, 58, 78, 111, 78, 65, 80, 100, 120, 35, 55, 50, 30, 50, 40, 40, 40, 55, 75, 80, 35, 35, 60, ~
$ Special_attack  <int> 65, 80, 100, 122, 60, 80, 109, 130, 159, 50, 65, 85, 135, 20, 25, 90, 20, 25, 45, 15, 35, 50, 70, 135, 25, 25, 5~
$ Special_defence <int> 65, 80, 100, 120, 50, 65, 85, 85, 115, 64, 80, 105, 115, 20, 25, 80, 20, 25, 80, 80, 35, 50, 70, 80, 35, 35, 70,~
$ Speed           <int> 45, 60, 80, 80, 65, 80, 100, 100, 100, 43, 58, 78, 78, 45, 30, 70, 50, 35, 75, 145, 56, 71, 101, 121, 72, 72, 97~
```

## 2. Data Cleaning 

### 2.1 ทำการ Cleaning เลขโดดที่มากเกินและน้อยเกินไป
```
data <- data %>% filter(HP > 1)
data <- data %>% filter(Total != 1125)
```

### 2.2 ทำการ Rename Colums
```
names(data)[6] <- "Special_attack" 
names(data)[7] <- "Special_defence"
```

## 3. หาค่าเฉลี่ยของ Attack

### ใช้ data แล้วตามด้วย $ เพื่อหา Colums ใน data ทำการเลือก attack และใส่ function mean() เพื่อหาค่าเฉลี่ยของ Attack ใน 

```
maxSpecialATK <- data$Special_attack %>% max() 
```
### Reult :

```
194
```

ค่าเฉลี่ยของ Attack คือ 194

## 4. หาค่าพลังสูงสุดของ Special_Attack กับ Special_Defence ว่าใครมีพลังที่เหมืนอกว่ากัน

### หา maxSpecialATK โดยการ นำ data ใส่ $ แล้วใส่ Colums ที่อยากจะหาในที่นี้เราต้องการรู้ค่า Max ของ Special_Attackและใส่ function Max เพื่อหาค่ามากที่สุด
```
maxSpecialATK <- data$Special_attack %>% max()
```

### หา maxSpecialDEF เหมือนกับ maxSpecialATK โดยการนำ Colums Special_Defence ใส่ function Max เพื่อหาค่าสูงสุด
```
maxSpecialDEF <- data$Special_defence %>% max()
```
### นำ maxSpecialATK มาลบกับ maxSpecialDEF 
ถ้าได้ค่าติดลบแสดงว่า maxSpecialDEF เป็นฝ่ายชนะ
ถ้าได้ค่าบวกแสดงว่า maxSpecialATK เป็นฝ่ายชนะ
```
maxSpecialATK - maxSpecialDEF
```
### Result : 
```
-36
```
แสดงว่า maxSpecialDEF เป็นฝ่ายชนะเพราะได้ค่าติดลบ

## 5. 

### 5.1 
```

```

### 
```

```

```
result
```

//คำตอบ

## 6. 

### 6.1
```

```

```

```

//คำตอบ

### 6.2 
```

```

```

```

//คำตอบ

### 6.3 
```

```

```

```

//คำตอบ

### 6.4 
```

```

```

```

//คำตอบ

## 7. 

### 7.1 
```

```

```

```

//คำตอบ

### 7.2 
```

```

```

```
//คำตอบ

## 8. 

### 8.1 
```

```

```
```

//คำตอบ

## 9. 

### 9.1 
```

```

```
result
```

//คำตอบ

## 10. 

### 10.1 
```

```

```
result
```

//คำตอบ

## About Us
งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี
### Team: บะหมี่ต้องใส่ชาม
1. ชื่อ จักริน นามสกุล ไชยบุบผา    StudentID: 63130500009
2. ชื่อ ชนันพร นามสกุล ผ่องศรี    StudentID: 63130500014
3. ชื่อ ชานนท์ นามสกุล รักดี    StudentID: 63130500020
4. ชื่อ นราวิชญ์ นามสกุล คำภูษา    StudentID: 63130500065

### Instructor
- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))



