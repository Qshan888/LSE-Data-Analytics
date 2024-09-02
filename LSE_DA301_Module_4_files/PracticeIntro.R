# Assign 'a' the numeric value '10', using the 'assigned to' operator, 
# creating an object:
a <- 10 

# Print the object.
a  


number <-120
fish <- 'goldfish'
distance <- 12.25
shoes <- '4x'
plane <- "Millennium Falcon"

print(number)
print(fish)
print(distance)
print(shoes)
print(plane)

# Assign the object name. 
name <- 'Andrew' 

# Specify the typeof() function.
typeof(name) 

# Specify the length() function.
length(name) 


# Create a vector, and assign it to the object x.
x <- c(1, 2, 3) 

# Determine the attribute of x.
attributes(x)


# Create an object and a vector. 
named.vec <- c('First'=1, 'Second'=2, 'Third'=3) 

# Find the attributes of named.vec.
attributes(named.vec) 


# Create a numeric vector.
c(1, 2, 3, 4, 5, 6, 7) 


# Create a vector, specify the assign() function, and call the c() function.
assign('vector1', c(1, 2, 3, 4, 5, 6, 7)) 

# Print the vector.
vector1 


# Create vectors.
numbers <- c(1, 22, 33, 44)
city <- 'London'
sentence <- "How long is this sentence?"
unknown <-'4i+2'

# Determine length and attribute of each vector.
length(numbers)
attributes(numbers)

length(city)
attributes(city)

length(sentence)
attributes(sentence)

length(unknown)
attributes(unknown)



# Recognise the assign operator, where the object x has been assigned the value 10.
x <- 10 

# Assign y the value 5.
y <- 5 

# Add the object x to y.
x + y 


x <- 10
y <- 5

x + y
x + y + 5

typeof(x)
typeof(y)


# Install the package to the system/add to your R installations.
install.packages('dynamicTreeCut')
install.packages('tidyverse')

# Make the package available to your document/R script.
library('dynamicTreeCut')

packageDescription('dynamicTreeCut')
help(package='dynamicTreeCut')

vignette(package='dynamicTreeCut')
vignette('dynamicTreeCut')
