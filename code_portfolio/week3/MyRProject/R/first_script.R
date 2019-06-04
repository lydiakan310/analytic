a =  data.frame("sex" = c("m", "f", "m"),
                "age" = c(19, 43, 25),
                "favorite.movie" = c("Moon", "The Goonies", "Spice World"))
b = mean(a$age)

c = table(a$sex)

ls()

club.df = read.table(file = 'http://nathanieldphillips.com/wp-content/uploads/2015/12/club.txt',
                     sep = '\t',
                     header = TRUE)
write.table(x = club.df,
            file = "data/club.txt",  
            sep = "\t") 

save(a, b, c,
     file = "data/myobjects.RData")
rm(list = ls())
ls()
