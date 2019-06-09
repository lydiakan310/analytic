#chapter3
#3.2.4 Exercises
#Run ggplot(data = mpg). What do you see?
ggplot(data = mpg)  
#see gray background
#How many rows are in mpg? How many columns?
str(mpg)  
#234 obs, 11 variables
#What does the drv variable describe? Read the help for ?mpg to find out.
#f = front-wheel drive, r = rear wheel drive, 4 = 4wd
#Make a scatterplot of hwy vs cyl.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = hwy, y = cyl))
#What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = class, y = drv)) 
#because class is categorical data


#3.3.1 Exercises
#What’s gone wrong with this code? Why are the points not blue?
  
  ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))
#color argument should be outside of aes()

#Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?
str(mpg)
#categorical: manufacturer, model, trans, drv, fl, class
#continuous: displ, year, cyl, cty, hwy

#Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = trans, y = model), color = "blue") 
#What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = trans, y = model), aes(x = hwy), color = "blue")   
#will show error
#What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = displ < 5)
#Error in layer

