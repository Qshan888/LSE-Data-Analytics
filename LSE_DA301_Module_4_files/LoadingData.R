# Determine the working directory.
getwd() 

# Change the current directory.
setwd(dir = '/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_4_files') 

# Import package.
library(tidyverse)

# Load the CSV file.
# You can use the specific file name if you are in the working directory.
df <- read.csv('/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_4_files/Data/bike_details.csv', header=TRUE)

# If you have to browse for the file, use file.choose().
df <- read.csv(file.choose(), header=TRUE)
# A window will open where you can browse and select the file.


