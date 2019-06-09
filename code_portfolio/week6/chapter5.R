#Chapter5
library(nycflights13)
library(tidyverse)

#5.2.4 Exercises
#Find all flights that
#Had an arrival delay of two or more hours
filter(flights, arr_delay >= 120)
#Flew to Houston (IAH or HOU)
filter(flights, dest == 'IAH' | dest =='HOU')
#Were operated by United, American, or Delta
filter(flights, carrier == "UA" | carrier == "AA" | carrier == "DL")
#Departed in summer (July, August, and September)
filter(flights, month == 7 | month == 8 | month == 9)
#Arrived more than two hours late, but didn’t leave late
filter(flights, arr_delay >= 120, dep_delay <= 0)
#Were delayed by at least an hour, but made up over 30 minutes in flight
filter(flights, arr_delay < 30, dep_delay >= 60)
#Departed between midnight and 6am (inclusive)
x1 <- filter(flights, dep_time >= 0000, dep_time <= 0600)
View (x1)
  
#How many flights have a missing dep_time? What other variables are missing? What might these rows represent?
sum (is.na(flights$dep_time))

#5.3.1 Exercises
#How could you use arrange() to sort all missing values to the start? (Hint: use is.na()).
names(flights)[colSums(is.na(flights)) >0]
flights %>% 
  arrange(desc(is.na(dep_time)),
          desc(is.na(dep_delay)),
          desc(is.na(arr_time)), 
          desc(is.na(arr_delay)),
          desc(is.na(tailnum)),
          desc(is.na(air_time)))
#Sort flights to find the most delayed flights. Find the flights that left earliest.
arrange(flights, desc(dep_delay))
arrange(flights, arr_delay)
#Sort flights to find the fastest flights.
arrange(flights, air_time)

#5.4.1 Exercises
#Brainstorm as many ways as possible to select dep_time, dep_delay, arr_time, and arr_delay from flights.
select(flights,dep_time,dep_delay,arr_time,arr_delay)
#What happens if you include the name of a variable multiple times in a select() call?
select(flights,dep_time,dep_time,arr_time,arr_delay)  
#What does the one_of() function do? Why might it be helpful in conjunction with this vector?
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
#Does the result of running the following code surprise you? How do the select helpers deal with case by default? How can you change that default?
select(flights, contains("TIME"))

