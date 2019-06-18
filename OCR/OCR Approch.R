```{r}

rm(list = ls()) #Clear all the data.
setwd("~/Documents/DevRabbits/images") #Set the directory.
#install.packages("tesseract")
library(tesseract)
library(magick)
eng <- tesseract("eng")

####### IMAGE 1 ######
text1 <- tesseract::ocr("1.jpeg", engine = eng)
cat(text1)
write(text1, "text1.txt")
#write.table(text1,"text1.txt")
print(text1)
#results <- tesseract::ocr_data("1.jpeg", engine = eng)
#print(results, n = 20)
#install.packages("magick")
#tesseract_info()
# image_trim("1.jpeg")
# img <- load.image("1.jpeg")
# getwd()
# file <- system.file("/Users/chanduboss/Documents/DevRabbits/images/1.jpeg",package='imager')


###### USING MAGICK FOR IMAGE 2 ########
library(magick)
library(magrittr)
text2 <- image_read("2.jpeg") %>%
  image_resize("2000") %>%
  image_convert(colorspace = 'gray') %>%
  image_trim() %>%
  image_ocr()


######### IMAGE 2 ########
# text2 <- tesseract::ocr("2.jpeg", engine = eng)
cat(text2)
write(text2, "text2.txt")
#write.table(text2,"text2.txt")
print(text2)

######## IMAGE 3 #########

text3 <- tesseract::ocr("3.jpeg", engine = eng)
cat(text3)
write(text3, "text3.txt")
#write.table(text3,"text3.txt")
print(text3)

######### IMAGE 4 ##########
text4 <- tesseract::ocr("4.jpeg", engine = eng)
cat(text4)
write(text4, "text4.txt")
#write.table(text4,"text4.txt")
print(text4)

############ IMAGE 5 ########
text5 <- tesseract::ocr("5.jpeg", engine = eng)
cat(text5)
write(text5, "text5.txt")
#write.table(text5,"text5.txt")
print(text5)

########## IMAGE 6 ##########
text6 <- tesseract::ocr("6.jpeg", engine = eng)
cat(text6)
write(text6, "text6.txt")
#write.table(text6,"text6.txt")
print(text6)

######## IMAGE 7 #########
text7 <- tesseract::ocr("7.jpeg", engine = eng)
cat(text7)
write(text7, "text7.txt")
#write.table(text7,"text7.txt")
print(text7)

########### IMAGE 8 ##########
text8 <- tesseract::ocr("8.jpeg", engine = eng)
cat(text8)
write(text8, "text8.txt")
#write.table(text8,"text8.txt")
print(text8)

```

```{r}
##### text 1 ######
library(readtext)
DATA_DIR <- system.file("test1.txt", package = "readtext")
T1= read.table("text1.txt", sep = "\t")
str(T1)

###### text 2 ####
library(readtext)
DATA_DIR <- system.file("test2.txt", package = "readtext")
T2= read.table("text2.txt", sep = "\t")
str(T2)

##### text 3 #####
library(readtext)
DATA_DIR <- system.file("test3.txt", package = "readtext")
T3= read.table("text3.txt", sep = "\t")
str(T3)
 

###### text 4 #####
library(readtext)
DATA_DIR <- system.file("test4.txt", package = "readtext")
T4= read.table("text4.txt", sep = "\t")
str(T4)

###### text 5 #####
library(readtext)
DATA_DIR <- system.file("test5.txt", package = "readtext")
T5= read.table("text5.txt", sep = "\t")
str(T5)

####### text 6 ######
library(readtext)
DATA_DIR <- system.file("test6.txt", package = "readtext")
T6= read.table("text6.txt", sep = "\t")
str(T6)

####### text 7 #######
library(readtext)
DATA_DIR <- system.file("test7.txt", package = "readtext")
T7= read.table("text7.txt", sep = "\t")
str(T7)
 
######## text 8 ######
library(readtext)
DATA_DIR <- system.file("test8.txt", package = "readtext")
T8= read.table("text8.txt", sep = "\t")
str(T8)
```

```{r}
library(stringr)
files <- list.files()
print(files)
getdata <- read.delim("text1.txt")
str(getdata)

p = "0399 9999 9999 9997 6542 aassds"
str_extract_all(p,"[0-9]+")
str_extract_all(text1, "[0-9]+")

s->"234321a"
s=1
s="23213 abcde

trackNumber <- function(s){
  num_string = paste(str_extract_all(s,"[0-9]+"))
     
 }
 
trackNumber <- function(s){
     num_string = paste(str_extract_all(s,"[0-9]+"))
 }
 
 
 trackNumber <- function(s){
     num_string = paste(str_extract_all(s,"[0-9]+"))
return num_string    

```

```{r}
trackNumber <- function(s)
  {
 num_string = paste(str_extract_all(s,"[0-9]+"))
     return(num_string)    
 }
 
 trackNumber <- function(s)
   {
  return (paste(str_extract_all(s,"[0-9]+")))
  return(num_string)    
 }
 trackNumber(s)

```

```{r}
trackNumber <- function(s){
   num_string = str_extract_all(s,"[0-9]+"), sep=" "

trackNumber <- function(s){
    num_string = str_extract_all(s,"[0-9]+"), 
    print(num_string)
    return(num_string)    
    }
trackNumber(s)


trackNumber <- function(s)
  {
    num_string = paste(str_extract_all(s,"[0-9]+"))
    return(num_string)    
 }
 trackNumber(s)
```

