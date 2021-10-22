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

## 1. Define questions

1. 
2. 
3. 
4. 
5. 
6. 
7. 
8. 

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

## 3. โจทย์

### Use select() to display a id , title and type then use filter() to find a film that is an episode //คำอธิบายว่า query ที่เขียนทำอะไรบ้าง
```
r file
```

```
      result
```

There are 23 episodes in this dataset. //คำตอบ

## 4. โจทย์

### 4.1 //คำอธิบายว่า query ที่เขียนทำอะไรบ้าง.
```
r file
```

### 4.2 //คำอธิบายว่า query ที่เขียนทำอะไรบ้าง
```
r file
```

```
result
```

//คำตอบ

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



