#  Import the library.
library (stringr)

# Create four strings. Use "".
string1 <- "R is a statistical programming language."
string2 <- "I like to code in R."
string3 <- "Coding in R is fun!"
string4 <- "Do you like to code in R?"

# Print the strings.
string1
string2
string3
string4

# Specify the function and pass the function's argument.

str_length(string1) 
str_length(string2) 
str_length(string3) 
str_length(string4)

# Specify the function and pass the string objects. 

str_c(string1, string2, string3, string4) 

# Specify the function, pass the string objects, 
# and indicate spaces for string separation. 

str_c(string1, string2, string3, string4, sep = ' ')

# Create and print a string.
string5 <- str_c(string1, string2, string3, string4, sep = ' ') 
string5 

# Determine the length of the string.
str_length(string5) 

# Create a second string by subsetting, and print it.
string6 <- str_sub(string5, 1, 81)
string6

# Create a third new string by subsetting, and print it.
string7 <- str_sub(string5, 83, 107) 
string7  

# Create a fourth new string by subsetting, and print it.
string8 <- str_sub(string5, 1, 50) 
string8 

# Truncate a string;
# Specify the source/object and 
# the number of characters to display.

str_trunc(string5, 10)

# Change the case of a string:
# All characters lower case
str_to_lower (string5) 

# All characters upper case
str_to_upper (string5)

# First letter in each word capitalised
str_to_title (string5)  

# First letter of each sentence capitalised
str_to_sentence (string5) 