#Chapter 8

#creating matrix and dataframe
x = 1:5
y = 6:10
z = 11:15
cbind(x,y,z)
rbind(x,y,z)

cbind(c(1, 2, 3, 4, 5),
      c("a", "b", "c", "d", "e"))

matrix(data = 1:10, nrow = 5, ncol = 2)
matrix(data = 1:10, nrow = 2, ncol = 5)
matrix(data = 1:10, nrow = 2, ncol = 5, byrow = TRUE)

survey = data.frame('index' = c(1,2,3,4,5),
                    'sex' = c('m','m','m','f','f'),
                    'age' = c(99,46,23,54,23))
survey
str(survey)
survey1 = data.frame('index' = c(1,2,3,4,5),
                     'sex' = c('m','m','m','f','f'),
                     'age' = c(99,46,23,54,23),
                     stringsAsFactors = FALSE)
str(survey1)


#functions of dataframes 
#head and tail of the df
head(ChickWeight)

tail(ChickWeight)

#viewing df
View(ChickWeight)

#summary of df
summary(ToothGrowth)

str(ToothGrowth)

#column names of df
names(ToothGrowth)

#df calculation 
ToothGrowth$len

mean(ToothGrowth$len)

table(ToothGrowth$supp)

head(ToothGrowth[c('len','supp')])

#add new columns
survey = data.frame("index" = c(1, 2, 3, 4, 5),
                    "age" = c(24, 25, 42, 56, 22))
survey$sex = c("m", "m", "f", "f", "m")

#change column names
names(survey)[1] = 'participant.number'
names(survey)[names(survey) == 'age'] = 'years'

#slicing df
survey[1,]
survey[,5]
survey[1:5,2]

ToothGrowth[1:6, 1]
ToothGrowth[1:3, c(1,3)]
ToothGrowth[1,]
ToothGrowth[,2]

ToothGrowth.VC = ToothGrowth[ToothGrowth$supp == 'VC', ]
ToothGrowth.OJ.a <- ToothGrowth[ToothGrowth$supp == "OJ" &
                                  ToothGrowth$dose < 1, ]
subset(x = ToothGrowth,
       subset = len < 20 &
         supp == "OJ" &
         dose >= 1)
subset(x = ToothGrowth,
       subset = len > 30 & supp == "VC",
       select = c(len, dose))


#with function 
health = data.frame("age" = c(32, 24, 43, 19, 43),
                     "height" = c(1.75, 1.65, 1.50, 1.92, 1.80),
                     "weight" = c(70, 65, 62, 79, 85))

health$weight / health$height ^ 2
with(health, height / weight ^ 2)

with(health, weight + height / age + 2 * height)

## Exercise 8.7 

#1. Combine the data into a single dataframe. Complete all the following exercises from the dataframe!
library(yarrr)

pirate_df = data.frame("Name" = c("Astrid","Lea","Sarina","Remon","Letizia",
                                     "Babice","Jonas","Wendy","Niveditha","Gioia"),
                          "Sex" = c("F","F","F","M","F","F","M","F","F","F"),
                          "Age" = c(30,25,25,29,22,22,35,19,32,21),
                          "Superhero" = c("Batman","Superman","Batman","Spiderman",
                                          "Batman","Antman","Batman","Superman","Maggott","Superman"),
                          "Tattoos" = c(11,15,12,5,65,3,9,13,900,0)
                          ,stringsAsFactors = FALSE)

#2. What is the median age of the 10 pirates?
median(pirate_df$Age) 
#25 

#3. What was the mean age of female and male pirates separately?
mean(pirate_df$Age[pirate_df$Sex == 'F'])
#mean age of female is 24.5
mean(pirate_df$Age[pirate_df$Sex == 'M']) 
#mean age of male is 32

#4. What was the most number of tattoos owned by a male pirate?
max(pirate_df$Tattoos[pirate_df$Sex == 'M'])  
#9 

#5. What percent of pirates under the age of 32 were female?
length(which(pirate_df$Age<32 & pirate_df$Sex == "F"))/length(which(pirate_df$Age<32))
#87.5% 

#6. What percent of female pirates are under the age of 32?
length(which(pirate_df$Age<32 & pirate_df$Sex == "F"))/length(which(pirate_df$Sex == 'F')) 
#87.5

#7. Add a new column to the dataframe called tattoos.per.year which shows how many tattoos each pirate has for each year in their life.
pirate_df = mutate(pirate_df,tattoos.per.year=Tattoos/Age)

#8. Which pirate had the most number of tattoos per year?
pirate_df$Name [pirate_df$tattoos.per.year == max(pirate_df$tattoos.per.year)]
#Niveditha
  
#9. What are the names of the female pirates whose favorite superhero is Superman?
pirate_df$Name[pirate_df$Superhero == 'Superman' & pirate_df$Sex == 'F']
#"Lea"   "Wendy" "Gioia"

#10. What was the median number of tattoos of pirates over the age of 20 whose favorite superhero is Spiderman?
median(pirate_df$Tattoos[pirate_df$Age > 20 & pirate_df$Superhero == 'Spiderman'])
#5 






