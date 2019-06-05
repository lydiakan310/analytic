library(tidyverse)

#read csv

read_csv("a,b,c
1,2,3
4,5,6")

read_csv("The first line of metadata
  The second line of metadata
  x,y,z
  1,2,3", skip = 2)

read_csv("# A comment I want to skip
  x,y,z
  1,2,3", comment = "#")

#read csv column names 
read_csv("1,2,3\n4,5,6", col_names = FALSE)

read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))

#represent missing values
read_csv("a,b,c\n1,2,.", na = ".")




###11.2.2 Exercises
#What function would you use to read a file where fields were separated with “|”?
#use read_delim() with | as delimiter

#Apart from file, skip, and comment, what other arguments do read_csv() and read_tsv() have in common?
#col_names, na, and locale 
 
#What are the most important arguments to read_fwf()?
#file and col_positions
  
#Sometimes strings in a CSV file contain commas. To prevent them from causing problems they need to be surrounded by a quoting character, like " or '. 
#By convention, read_csv() assumes that the quoting character will be ", and if you want to change it you’ll need to use read_delim() instead. What arguments do you need to specify to read the following text into a data frame?
#"x,y\n1,'a,b'"
read_delim("x,y\n1,'a,b'", delim = ",",quote = "'")

#Identify what is wrong with each of the following inline CSV files. What happens when you run the code?
  
read_csv("a,b\n1,2,3\n4,5,6")
#two column headers are defined, but rows have 3 columns
read_csv("a,b,c\n1,2\n1,2,3,4")
#three column headers are defined, row 1 has 2 columns, 3rd one defaults to NA. 
#row 2 has 4 columns, so the 4th one is dropped
read_csv("a,b\n\"1")
#two column headers, only one column for the first row
read_csv("a,b\n1,2\na,b")
#the second row has the same value as the header
read_csv("a;b\n1;3")
#dose not separate the data by ;


#parsing a vector
str(parse_logical(c("TRUE", "FALSE", "NA")))
str(parse_integer(c("1", "2", "3")))
str(parse_date(c("2010-01-01", "1979-10-14")))
parse_integer(c("1", "231", ".", "456"), na = ".")
x = parse_integer(c("123", "345", "abc", "123.45"))
problems(x)

parse_double("2.34")
parse_double("2.34", locale = locale(decimal_mark = ','))

parse_number("100%")
parse_number('$20')
parse_number('this is 20 bucks')
parse_number("$123,456,789")
parse_number("123.456.789", locale = locale(grouping_mark = "."))
parse_number("123'456'789", locale = locale(grouping_mark = "'"))
charToRaw("Really")

#parsing with encoding
x1 = "El Ni\xf1o was particularly bad this year"
x2 = "\x82\xb1\x82\xf1\x82\xc9\x82\xbf\x82\xcd"

parse_character(x1, locale = locale(encoding = "Latin1"))
parse_character(x2, locale = locale(encoding = "Shift-JIS"))

guess_encoding(charToRaw(x1))
guess_encoding(charToRaw(x2))


#parsing factors
fruit = c("apple", "banana")
parse_factor(c("apple", "banana", "bananana"), levels = fruit)

#parsing date and times
parse_datetime("2010-10-01T2010")
parse_datetime("20101010")
parse_date("2010-10-01")

library(hms)
parse_time("01:10 am")
parse_time("20:10:01")

parse_date("01/02/15", "%m/%d/%y")
parse_date("01/02/15", "%d/%m/%y")
parse_date("01/02/15", "%y/%m/%d")
parse_date("1 janvier 2015", "%d %B %Y", locale = locale("fr"))

###11.3.5 Exercises

#What are the most important arguments to locale()?
#date_names, date_format, and time_format  


#What happens if you try and set decimal_mark and grouping_mark to the same character? 
#What happens to the default value of grouping_mark when you set decimal_mark to “,”? 
#What happens to the default value of decimal_mark when you set the grouping_mark to “.”?
#locale funtion will raise error if they are the same
#',' will be replaced by '.'
#'.' will be replaced by ','

#I didn’t discuss the date_format and time_format options to locale(). What do they do? Construct an example that shows when they might be useful.
#they are for specify the date and time formats. 
parse_date("1 janvier 2019", "%d %B %Y", locale = locale("fr"))

#If you live outside the US, create a new locale object that encapsulates the settings for the types of file you read most commonly.
locale(date_format = "%d/%m/%Y", decimal_mark = ".", grouping_mark = ",")

#What’s the difference between read_csv() and read_csv2()?
#read_csv uses ',' as delimiter and read_csv2 use ';'
  
#What are the most common encodings used in Europe? What are the most common encodings used in Asia? Do some googling to find out.
#ISO 8859-1 is the default encoding in Western Europe
#Guobiao and Big-5 are popular encodings for Chinese characters


#Generate the correct format string to parse each of the following dates and times:
d1 <- "January 1, 2010"
d2 <- "2015-Mar-07"
d3 <- "06-Jun-2017"
d4 <- c("August 19 (2015)", "July 1 (2015)")
d5 <- "12/30/14" # Dec 30, 2014
t1 <- "1705"
t2 <- "11:15:10.12 PM"

parse_date(d1, "%B %d, %Y")
parse_date(d2, "%Y-%b-%y")
parse_date(d3, "%d-%b-%Y")
parse_vector(d4, collector = col_date(format="%B %d (%Y)"))
parse_date(d5, "%m/%d/%y")
parse_time(t1, "%H%M")
parse_time(t2,"%H:%M:%OS %p")


#guess parser
guess_parser("2019-06-01")
guess_parser("14:01")
guess_parser(c("TRUE", "FALSE"))
guess_parser(c("1", "5", "9"))
guess_parser(c("12,352,561"))



