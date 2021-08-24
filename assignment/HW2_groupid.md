# Assignment 2 (Group)
Explore 2 dataset that given then finding descriptive statistics and summary result in form of sentences/paragraph at least 5 topics.

### Answer

1.) หาค่าเฉลี่ย,min,max ของอายุใน survey table
```{R}
library(MASS)
min(survey$Age)
max(survey$Age)
mean(survey$Age)
```

Descriptive statistics Statement
```{R}
เรียกใช้ library ของ MASS
หา Min ของ Survey โดยการเขียน min(survey$Age)
หา Max ของ Survey โดยการเขียน max(survey$Age)
หา Mean ของ Survey โดยการเรียน mean(survey$Age)
survey$Age เพื่อบอกว่าเราใช้ข้อมูลชุดไหนอยู่และตามด้วย $ เพื่อเรียก Colum ที่เราจะหา
```

2.) จงหาว่าค่าเฉลี่ยของความกว้างของมือด้านใดที่กว้างกว่ากัน ระหว่าง writing hand กับ non-writing hand
```{R}
library(MASS)
mean(survey$Wr.Hnd,na.rm = TRUE)#18.66907
mean(survey$NW.Hnd,na.rm = TRUE)#18.58263
#wr.hand > nw.hand 
```

Descriptive statistics Statement
```{R}
ใช้คำสั่ง mean ในการหาค่าเฉลี่ยของ wr.hand และ nw.hand แล้วนำมาลบกัน 
ป.ล ใช้ na.rm = true เพื่อเอาค่า NA ออกไปจากการคิดเลข
```

3.) หา column ที่2 row ที่3 ของ survey table
```{R}
library(MASS)
survey[2,4] #[1] Left,Levels: Left Right
```

Descriptive statistics Statement
```{R}
ใช้คำสั่ง ชื่อตาราง[column,row] เพื่อเลือกตำแหน่งของข้อมูลที่เราต้องการได้
```

4.) หาความถี่ survey ของเพศแต่ละเพศ
```{R}
summary(factor(survey$Sex))
```

Descriptive statistics Statement
```{R}
เรียกใช้คำสั่ง summary ให้หาค่าความถีโดยใช้คำ factor ส่วนของ เพศโดยเลือกใช้คำสั่ง factor 
เนื่องจากข้อมูลของเพศเป็นข้อมูลเลือกคุณภาพจึงเหมาะกับการใช้ factor
```

5.) จงหาว่าค่าเฉลี่ยของน้ำหนักหัวใจของแมวเพศใดมีค่ามากกว่ากัน
```{R}
View(cats)
table(cats[1:47,1])
table(cats[48:144,1])
mean(cats[1:47,3])    #เพศเมีย 9.202128
mean(cats[48:144,3])  #เพศผู้ 11.32268
#ค่าเฉลี่ยน้ำหนักหัวใจเพศผู้มากกว่าเพศเมีย

Descriptive statistics Statement
```{R}
จากโจทย์จะทำการเรียกดูตาราง cats ก่อนเพื่ออ่านการเรียงลำดับเพศของแมว 
และสังเกตได้ว่าตารางจะเรียงให้เพศเมียขึ้้นก่อนเพศผู้
โดยเพศเมียจะอยู่ 47 ลำดับแรก และเพศผู้จะอยู่ลำดับที่ 48-144
และทำการตรวจให้แน่ใจอีกครั้งด้วยคำสั่ง table พบว่าเป็นจริง
จากนั้นจึงใช้คำสั่ง mean หาค่าตามตำแหน่ง


### Team: บะหมี่ต้องใส่ชาม

1. ชื่อ จักริน นามสกุล ไชยบุบผา    StudentID: 63130500009
2. ชื่อ ชนันพร นามสกุล ผ่องศรี    StudentID: 63130500014 
3. ชื่อ ชานนท์ นามสกุล รักดี    StudentID: 63130500020
4. ชื่อ นราวิชญ์ นามสกุล คำภูษา    StudentID: 63130500065
