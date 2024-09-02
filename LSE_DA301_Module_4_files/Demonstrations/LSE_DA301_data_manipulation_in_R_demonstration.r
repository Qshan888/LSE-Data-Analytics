# LSE Data Analytics Online Career Accelerator
# DA301: Advanced Analytics for Organisational Impact

# Data cleaning and wrangling with R - Demonstration video

###############################################################################

# This is a demonstration on how to tidy a data set using common dplyr functions.
# In this demonstration, you will learn:
## - how to sense-check and preview a data set with dplyr functions
## - how to tidy and fix common errors in a data set
## - how to manipulate data using the dplyr package.

###############################################################################

# 1. Import the necessary package

# Import the tidyverse package.
library('tidyverse')


# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_4_files/Data') 

# Import the data set.
# You can choose how to import the CSV file.
#wages <- read.csv(file.choose(), header=T)

# Set the working directory.
# Import the CSV file (wages.csv).
wages <- read.csv('wages.csv', header = TRUE)


# View the data frame.
head(wages)

# View the data frame.
View(wages)

################################################################################

# 2. Explore the data set

# Convert data frame to a tibble.
# Note that as.tibble() might be outdated depending on your R version.
as_tibble(wages)


# Use the glimpse() function.
glimpse(wages)


# Use the summary() function.
summary(wages)

###############################################################################

# 3. Explore the data set

# Return a frequency table for the 'sex' column.
table(wages$sex)


# Return a frequency table for the 'region' column.
table(wages$region)


## What we want to do:
# Get rid of 'sex' and 'region' columns.
# Check why 'age' is not numeric.
# Convert 'race' to factor (categorical variable).


# Remove the 'sex' and 'region' columns.
wages2 <- select(wages, -sex, -region)


# Check the new data frame.
head(wages2)

################################################################################

# 4. Prepare the data

# Convert 'race' to factor (categorical variable).
wages3 <- mutate(wages2,
                 race = as.factor(race))


# View as a tibble.
as_tibble(wages3)


# View summary.
summary(wages3)


# Check why 'age' is not numeric.
wages4 <- mutate(wages3,
                 ageNum = as.numeric(age))


# Check the ageNum data.
summary(wages4$ageNum)


# Delete the row because of NA values.
wages5 <- filter(wages4,
                 !is.na(ageNum))


# Check the wages5 data set dimensions.
dim(wages5)


# Find the row where ageNum is NA.
filter(wages4, is.na(ageNum))


# Fix the error 5o (a five and an 'o') in the ageNum column.
# Find the row with the NA value.
which(is.na(wages4$ageNum))


# Correcting the value "5o" to 50.
wages4$ageNum[which(is.na(wages4$ageNum))] <- 50


# Check the data set to see if the error is fixed.
summary(wages4$ageNum)


# View summary of wages4.
summary(wages4)

###############################################################################

# 5. Visualise the data

# Explore the height data in a plot.
plot(hist(wages4$height))


# View top rows of wages4 height column to see values.
head(wages4$height)


# Create a data set with cm values.
wagesCm <- filter(wages4,
                  height > 100)


# Quick look at wagesCm height.
summary(wagesCm$height)

# Convert centimeters to inches.
wagesCm <- mutate(wagesCm,
                  height = round(height/2.54))


# Check the data.
summary(wagesCm$height)


# Combine the two data sets.
wagesInches <- filter(wages4, 
                      height <= 100)

wagesClean <- rbind(wagesInches, wagesCm)


# Final look at wagesClean.
summary(wagesClean)


# View the new height data in a plot and compare to previous histogram.
plot(hist(wagesClean$height))

###############################################################################

# 6. Save the new data

# Save the data set as a csv file.
write.csv(wagesClean, 'wages_clean.csv')


################################################################################


# 7. Additional functions of dplyr.

# If you need to import the CSV file (wages_clean.csv).
wagesClean <- read.csv(file.choose(), header=T)

# View the data frame.
head(wagesClean)


# Filter a column and specify criteria.
filter(wagesClean, age==25, daily_wage>110)

glimpse(wagesClean)

# Use the arrange() function and specify the columns to be ordered.
arrange(wagesClean, race, job_class, education)

arrange(wagesClean, desc(age))

arrange(wagesClean, age)


# To create a new element by dividing wage by logwage. 
wages_fin <- mutate(wagesClean, new_var=ageNum/daily_wage)


# View first 10 rows of the data frame.
head(wages_fin, 10)


################################################################################

# 8. Save your script.


################################################################################


