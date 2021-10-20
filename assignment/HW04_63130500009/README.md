# Assignment 4 (Individual 5%): Data Visualization

Superstore Sales Dataset(https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv)

**Created by Name-Surname (ID: 63130500009)**

### My Step
1. Loading Library and dataset
2. Check table
3. Define a question

## Define a question

1.Explore the dataset that you have select.
2.Transform data with dplyr and finding insight the data at least 6 issues. Show your code, result and summary in form of sentence/paragraphs.
3.Using ggplot2 to create 2 graphs and explain each graph.
4.In this part, you need to using command from tidyverse (e.g. lubridate, stringr, forcats) that not learned in class and explain this command how to used it. If you can't implement to this dataset, you can select one command and show example how to used it.
5.Do in Markdown File (md or Rmd) and push into your folder in Team Repository. (Same as Workshop I)
6.Copy link to access this folder and paste into PDF file Part A


## Step 0: Loading library and dataset

```
# Library
library(dplyr)
library(readr)      
library(ggplot2)

# Dataset
SuperStore_sales <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
```

## Step 1: Explore the dataset that you have select.

Use glimps() for look row and type of data
```
SuperStore_sales %>% glimpse();
```
Result:
```
Rows: 9,800
Columns: 18
$ Row.ID        <int> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,~
$ Order.ID      <chr> "CA-2017-152156", "CA-2017-152156", "CA-20~
$ Order.Date    <chr> "08/11/2017", "08/11/2017", "12/06/2017", ~
$ Ship.Date     <chr> "11/11/2017", "11/11/2017", "16/06/2017", ~
$ Ship.Mode     <chr> "Second Class", "Second Class", "Second Cl~
$ Customer.ID   <chr> "CG-12520", "CG-12520", "DV-13045", "SO-20~
$ Customer.Name <chr> "Claire Gute", "Claire Gute", "Darrin Van ~
$ Segment       <chr> "Consumer", "Consumer", "Corporate", "Cons~
$ Country       <chr> "United States", "United States", "United ~
$ City          <chr> "Henderson", "Henderson", "Los Angeles", "~
$ State         <chr> "Kentucky", "Kentucky", "California", "Flo~
$ Postal.Code   <int> 42420, 42420, 90036, 33311, 33311, 90032, ~
$ Region        <chr> "South", "South", "West", "South", "South"~
$ Product.ID    <chr> "FUR-BO-10001798", "FUR-CH-10000454", "OFF~
$ Category      <chr> "Furniture", "Furniture", "Office Supplies~
$ Sub.Category  <chr> "Bookcases", "Chairs", "Labels", "Tables",~
$ Product.Name  <chr> "Bush Somerset Collection Bookcase", "Hon ~
$ Sales         <dbl> 261.9600, 731.9400, 14.6200, 957.5775, 22.~
```
โดยข้อมูลชุดนี้มี Row อยู่ 9 Row 18 Column ข้อมูลส่วนมากเป็น Char โดยเป็นข้อมูลที่เก็บ Order และ Info ของลูกค้า

## Step 2: Transform data with dplyr and finding insight the data at least 6 issues. Show your code, result and summary in form of sentence/paragraphs.
### 2.1
ข้อมูลชุดนี้เกิดการ Order อยู่ในช่วงปี 2015-2019
```
SuperStore_sales %>% filter(between(format(as.Date(Order.Date,format = "%d/%m/%Y"),"%Y"),2015,2019))
```
### 2.2
ค่าเฉลี่ยต่างๆของแต่ละ Row (ส่วนมากที Row เป็น Char จึงดูข้อมูลพวก avg,max,min ได้ไม่ค่อยเยอะ)
```
SuperStore_sales %>% summary()
```
### 2.3
ข้อมูลชุดนี้มีการ Order จากทาง West มากที่สุด
```
SuperStore_sales %>% count(Region)
```
Result:
```
   Region    n
1 Central 2277
2    East 2785
3   South 1598
4    West 3140
```
### 2.2
ค่าเฉลี่ยต่างๆของแต่ละ Row (ส่วนมากที Row เป็น Char จึงดูข้อมูลพวก avg,max,min ได้ไม่ค่อยเยอะ)
```
SuperStore_sales %>% summary()
```
### 2.4
ข้อมูลชุดนี้มีลูกค้าอยู่หลายเมือง แต่มีลูกค้าแต่เพียงประเทศเดียว
```
SuperStore_sales %>% distinct(City)
SuperStore_sales %>% distinct(Country)
```
### 2.5
ข้อมูลชุดนี้เป็นข้อมูลที่ไม่กระจายตัวมาก
```
SuperStore_sales %>% arrange(desc(Sales)) %>% select(Row.ID,Sales) 
```
### 2.6
ข้อมูลชุดนี้มี Segment อยู่ 3 ที่ โดยส่วนมาก อยู่ที่ Consumer
```
SuperStore_sales %>% count(Segment) 
```
Result:
```
1    Consumer 5101
2   Corporate 2953
3 Home Office 1746
```
## Step 3: Using ggplot2 to create 2 graphs and explain each graph
### 3.1 
Count of Sub.Category
```
SuperStore_sales %>% ggplot(aes(Sub.Category))+geom_bar() 
```
Result:
![image](https://user-images.githubusercontent.com/72536629/138091861-de3365cf-44c8-4f78-9b9e-c6b52a462dfa.png)

เป็นการาฟที่แสดงให้เห็นว่า sub.category มี Binders มากที่สุด

### 3.2 
Count of Region
```
SuperStore_sales %>% ggplot(aes(Region))+geom_bar() 
```
Result:
![RegionBar](https://user-images.githubusercontent.com/72536629/138097966-0938cf47-b458-46de-a2df-835950a5570e.PNG)


เป็นการาฟที่แสดงให้เห็นว่า sub.category มี Binders มากที่สุด
