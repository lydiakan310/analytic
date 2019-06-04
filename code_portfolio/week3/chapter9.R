##chapter 9
# get the current working directory
getwd()

#change the working directory to week3 folder
setwd(dir = "/Users/lydiakan/Desktop/week3")

#list out all the objects in workspace 
ls()

# saving different types of files as .RData files
study1.df <- data.frame(id = 1:5, 
                        sex = c("m", "m", "f", "f", "m"), 
                        score = c(51, 20, 67, 52, 42))

score.by.sex <- aggregate(score ~ sex, 
                          FUN = mean, 
                          data = study1.df)

study1.htest <- t.test(score ~ sex, 
                       data = study1.df)


save(study1.df, score.by.sex, study1.htest,
     file = "study1.RData")

save.image(file = "projectimage.RData")

#loading .RData files
load(file = "study1.RData")
load(file = "data/projectimage.RData")

#remove .RData files
rm(study1.df)
rm(list = ls())


#write data to .txt file
library(yarrr)
write.table(x = pirates,
            file = "pirates.txt", 
            sep = "\t")   

#read data into R
mydata <- read.table(file = 'pirates.txt',   
                     sep = '\t',                  
                     header = TRUE,              
                     stringsAsFactors = FALSE) 

#read data from web
fromweb <- read.table(file = 'http://goo.gl/jTNf6P',
                      sep = '\t',
                      header = TRUE)




