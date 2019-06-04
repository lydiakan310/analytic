##chapter 4 

library(readr)
#read csv data
ozone = read_csv('US EPA data 2017.csv')

#replace space as . for columns name 
names(ozone) <- make.names(names(ozone))

#check numbers of rows and columns 
nrow(ozone)
ncol(ozone)

#check detail of the data set
str(ozone)

#look at top and bottom of the data
head(ozone)
tail(ozone)

#counting elements for a column
table(ozone$Sample.Duration)

#use dplyr to look into data
library(dplyr)
filter(ozone, Sample.Duration == "24 HOUR") %>% 
  select(State.Name, County.Name, Arithmetic.Mean)

#convert the data to dataframe
filter(ozone, Sample.Duration == "24 HOUR") %>% 
  select(State.Name, County.Name, Arithmetic.Mean) %>%
  as.data.frame

#find unique records
select(ozone, State.Name) %>% unique %>% nrow
unique(ozone$State.Name)

#summarise data
ranking <- group_by(ozone, State.Name, County.Name) %>%
summarize(ozone = mean(Arithmetic.Mean)) %>%
as.data.frame %>% arrange(desc(ozone))
