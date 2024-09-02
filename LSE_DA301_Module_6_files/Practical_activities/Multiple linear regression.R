# 1. Prepare your workstation.
# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_6_files/Data') 

# Import tidyverse.
library(tidyverse)

# Set your working directory.
# Import the CSV file.
wine <- read.csv('wine.csv', header=TRUE)

# Explore the data set.
summary(wine)
dim(wine)

# Check for na
na_counts <- colSums(is.na(wine))
na_counts


# Determine correlation between variables.
cor(wine)


# Install the psych package.
install.packages('psych')

# Import the psych package.
library(psych)

# Use the corPlot() function.
# Specify the data frame (wine) and set 
# character size (cex=2).
corPlot(wine, cex=1)


# Create a new object and 
# specify the lm function and the variables.
modela = lm(Price~AGST+HarvestRain, data=wine)

# Print the summary statistics.
summary(modela)


# Add new variables.
modelb = lm(Price~AGST+HarvestRain+WinterRain+Age+FrancePop,
            data=wine)

# Change the model name.
summary(modelb)


# New model.
modelc = lm(Price~AGST+HarvestRain+WinterRain+Age,
            data=wine) 

summary(modelc)

# Remove 'Age', and change the model name.
modeld = lm(Price~AGST+HarvestRain+WinterRain,
            data=wine)

summary(modeld) 


# Load the new data file (wine_test.csv), and view its structure.
winetest <- read.csv(file.choose(), header=TRUE)

# View the data.
str(winetest)

# Create a new object and specify the predict function.
predictTest = predict(modelc, newdata=winetest,
                      interval='confidence')

# Print the object.
predictTest 



