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

ใช้ data แล้วตามด้วย $ เพื่อหา Colums ใน data ทำการเลือก attack และใส่ function mean() เพื่อหาค่าเฉลี่ยของ Attack ใน 

```
maxSpecialATK <- data$Special_attack %>% max() 
```
Result :

```
194
```

ค่าเฉลี่ยของ Attack คือ 194

## 4. หาค่าพลังสูงสุดของ Special_Attack กับ Special_Defence ว่าใครมีพลังที่เหมืนอกว่ากัน

หา maxSpecialATK โดยการ นำ data ใส่ $ แล้วใส่ Colums ที่อยากจะหาในที่นี้เราต้องการรู้ค่า Max ของ Special_Attackและใส่ function Max เพื่อหาค่ามากที่สุด
```
maxSpecialATK <- data$Special_attack %>% max()
```

หา maxSpecialDEF เหมือนกับ maxSpecialATK โดยการนำ Colums Special_Defence ใส่ function Max เพื่อหาค่าสูงสุด
```
maxSpecialDEF <- data$Special_defence %>% max()
```
นำ maxSpecialATK มาลบกับ maxSpecialDEF 
ถ้าได้ค่าติดลบแสดงว่า maxSpecialDEF เป็นฝ่ายชนะ
ถ้าได้ค่าบวกแสดงว่า maxSpecialATK เป็นฝ่ายชนะ
```
maxSpecialATK - maxSpecialDEF
```
Result : 
```
-36
```
แสดงว่า maxSpecialDEF เป็นฝ่ายชนะเพราะได้ค่าติดลบ

## 5. แสดงจำนวน ROWS ที่มี Special_Attack ที่มีมากกว่า 100 โดยให้ List ข้อมูลมาแค่ Name และ Special_Attack
ใช้ filter เพื่อเอา Special_Attack ที่มากกว่า 100 เข้ามาแล้วทำการ select คือการเลือกว่าเราอยากได้ข้อมูลชุดไหนบ้าง จากนั้นเลือก Name และ Special_Attack เพื่อทำการ list colums เฉพาะ name และ special_attack

```
data %>% select(Name,Special_attack)  %>% filter(Special_attack > 100)
```

Result :  
```
183 ROWS
```

มีจำนวน ROWS ที่ Special_Attack มากกว่า 100 อยู่ 183 ROWS

## 6. หาค่า Mean Max Min Q3 จาก Colums Total

### 6.1 หาค่า Mean
โดยการใส่ function mean
```
data$Total %>% mean()
```
Result : 
```
438.8523
```

ได้ค่าเฉลี่ย Total คือ 438.8523

### 6.2 หาค่า Max
โดยการใส่ function max
```
data$Total %>% max()
```
Result : 
```
780
```

ได้ค่า Total สูงสุด คือ 780

### 6.3 หาค่า Min
โดยการใส่ function min
```
data$Total %>% min()
```
Result :
```
175
```

ได้ค่า Total ต่ำสุด คือ 175

### 6.4 หาค่า Q3
โดยการใส่ function quantile() แล้วใน () ให้ใส่ค่า quantile ของเราอยากเช่น 0.75 คือ Q3
```
data$Total %>% quantile(0.75)
```
Result :
```
515
```

ได้ค่า Total Q3 คือ 515

## 7. Lowest 25 อันดับของตัวที่มี HP ต่ำที่สุดตัวไหนบ้างที่มีค่า atk + sp atk มากกว่าค่า HP ของ Top 25 max XP

### 7.1 สร้างคอลัมน์ all atk (atk+sp atk) โดยเรียงตามลำดับจาก 25 ลำดับที่ hp น้อยที่สุด
```
data %>% arrange(HP) %>% head(25) %>% mutate(Allatk = Attack+Special_attack) %>% select(Name,HP,Allatk) %>%glimpse()
```

Result:
```
Rows: 25
Columns: 3
$ Name   <chr> "Diglett", "Mega Diglett", "Magikarp", "Pichu", "Shuckle", "Feebas", "Duskull", "Mime Jr.", "Abra", "Magnemite", "Wimpod"~
$ HP     <int> 10, 10, 20, 20, 20, 20, 20, 20, 25, 25, 25, 25, 28, 28, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30, 30
$ Allatk <int> 90, 90, 25, 75, 20, 25, 70, 95, 125, 130, 55, 45, 70, 100, 81, 81, 110, 135, 130, 110, 115, 135, 60, 90, 80
```

### 7.2 ลิลต์ลำดับของ hp สูงที่สุด 25 ลำดับ (อันดับที่ 25 ของ top 25 max hp คือ hp =126)


```
data %>% arrange(desc(HP)) %>% head(25) %>% select(Name,HP) %>% glimpse()
```

Result:
```
Rows: 25
Columns: 2
$ Name <chr> "Blissey", "Chansey", "Guzzlord", "Mega Zygarde X", "Regidrago", "Wobbuffet", "Wailord", "Alomomola", "Snorlax", "Slaking",~
$ HP   <int> 255, 250, 223, 216, 200, 190, 170, 165, 160, 150, 150, 150, 150, 144, 140, 140, 137, 137, 135, 135, 130, 130, 130, 126, 126
```

### 7.3 ดังนั้นเลยเพิ่ม filter all atk > 126 เพื่อหาตัวที่ มี all atk มากกว่า
```
data %>% arrange(HP) %>% head(25) %>% mutate(Allatk = Attack+Special_attack) %>% select(Name,HP,Allatk) %>%  filter(Allatk > 126) %>% glimpse()
```

Result:
```
Rows: 4
Columns: 3
$ Name   <chr> "Magnemite", "Gastly", "Krabby", "Kabuto"
$ HP     <int> 25, 30, 30, 30
$ Allatk <int> 130, 135, 130, 135
```

## 8. หาว่าในบรรดาตัวละคร top 10 ที่มีค่า Speed มากที่สุด มีตัวใดบ้างที่มีค่า sp defence ต่ำกว่าค่าเฉลี่ย เเละต่ำกว่าเท่าไหร่

### 8.1 หาว่าในบรรดาตัวละคร top 10 ที่มีค่า Speed มากที่สุด
```
data %>% arrange(desc(Speed)) %>% head(10)
```
Result: 
```
> data %>% arrange(desc(Speed)) %>% head(10)
              Name Total  HP Attack Defence Special_attack Special_defence Speed
1        Regieleki   580  80    100      50            100              50   200
2    Mega Deoxys X   600  50     95      90             95              90   180
3          Ninjask   456  61     90      45             50              50   160
4        Pheromosa   570  71    137      37            137              37   151
5    Mega Alakazam   600  55     50      65            175             105   150
6        Electrode   490  60     50      70             80              80   150
7  Mega Aerodactyl   615  80    135      85             70              95   150
8           Deoxys   600  50    150      50            150              50   150
9      Mega Deoxys   600  50    180      20            180              20   150
10  Mega Calyrex X   680 100     85      80            165             100   150
```
### 8.2 filter ตัวที่มีค่า Special_defence ต่ำกว่าค่าเฉลี่ย
```
data %>% arrange(desc(Speed)) %>% head(10) %>% filter(Special_defence < mean(Special_defence)) %>% select(Name)
```
Result:
```
> data %>% arrange(desc(Speed)) %>% head(10) %>% filter(Special_defence < mean(Special_defence)) %>% select(Name)
         Name
1   Regieleki
2     Ninjask
3   Pheromosa
4      Deoxys
5 Mega Deoxys
```
ได้เป็น Regieleki, Ninjask, Pheromosa, Deoxys, Mega Deoxys

## 9. หาตัวละครที่มีสปีดสูงที่สุด จากบรรดาตัวละครที่มีค่าพลังโจมตีสูงกว่าค่าเฉลี่ย

### 9.1 filter หาตัวที่มี speed มากกว่าค่าเฉลี่ยของพลังโจมตีแล้วเรียงค่า speed จากมากไปน้อย โดยแสดงแค่ตัวแรก
```
data %>% filter(Speed > mean(Attack)) %>% arrange(desc(Speed)) %>% head(1) %>% select(Name)
```
Result:
```
> data %>% filter(Speed > mean(Attack)) %>% arrange(desc(Speed)) %>% head(1) %>% select(Name)
       Name
1 Regieleki
```
ได้เป็นตัว Regieleki

## 10. find max of atk สูงกว่า average speed เท่าไหร่

### 10.1 หาค่า max() ของ Attack
```
max(data$Attack)
```
Result:
```
> max(data$Attack)
[1] 190
```
### 10.2 หาค่าเฉลี่ยของ speed
```
mean(data$Speed)
```
Result:
```
> mean(data$Speed)
[1] 68.77661
```
### หาว่าต่างกันเท่าไหร่
```
max(data$Attack) - mean(data$Speed)
```
Result:
```
> max(data$Attack) - mean(data$Speed)
[1] 121.2234
```
ได้คำตอบว่า 121.2234

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



