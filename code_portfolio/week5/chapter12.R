#chapter12 

#looking into data
library(tidyverse)

table1
table2
table3
table4a
table4b

#data manipulation
table1 %>% mutate(rate = cases / population * 10000)
table1 %>% count(year, wt = cases)

#visualise data
library(ggplot2)
ggplot(table1, aes(year, cases)) +
  geom_line(aes(group = country), colour = 'grey50') +
  geom_point(aes(colour = country))

#12.2.1 Exercises
#1. Using prose, describe how the variables and observations are organised in each of the sample tables.

#2. Compute the rate for table2, and table4a + table4b. You will need to perform four operations:
  
#Extract the number of TB cases per country per year.
#Extract the matching population per country per year.
#Divide cases by population, and multiply by 10000.
#Store back in the appropriate place.
#Which representation is easiest to work with? Which is hardest? Why?
#Recreate the plot showing change in cases over time using table2 instead of table1. What do you need to do first?

#using gather function
table4a %>% gather(`1999`, `2000`, key = 'year', value = 'cases')
table4b %>% gather(`1999`, `2000`, key = "year", value = "population")
tidy4a <- table4a %>% gather(`1999`, `2000`, key = "year", value = "cases")

#join functions
tidy4b <- table4b %>% gather(`1999`, `2000`, key = "year", value = "population")
left_join(tidy4a, tidy4b)

#spread function 
table2 %>% spread(key = type, value = count)
