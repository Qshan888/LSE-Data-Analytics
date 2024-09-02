# LSE Data Analytics Online Career Accelerator

# DA301: Advanced Analytics for Organisational Impact

# Demonstration: Time series analysis in R

###############################################################################

# A confectionery wholesaler in the US, Sweets n Stuff, has warehouses across
# the country that it needs to keep stocked with its sweets and chocolates in
# preparation for seasonal variation in confectionery consumption. To help
# estimate stock and inventory for these warehouses, Sweets n Stuff has access
# to the national industrial production index. The industrial production index
# releases data about the production of sugar and confectionery products in the
# US. 

# Sweets n Stuff has approached you to help ensure it has adequate supply when
# demand may peak. It also wants to know when it should place future orders and
# when it should be aware of changes in demand to adjust its production and
# stock. 

# The demonstration explains how to perform time series analysis in R. 
# In this video, you’ll learn:
# - how to define a time series in R
# - how to ensure your data is in a format R can recognise
# - how to do some preliminary work.

###############################################################################

# 1. Prepare your workstation.
# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_6_files/Data') 


# Install necessary package.
# Generic function for forecasting.
install.packages('forecast')
# Time series analysis.
install.packages('tseries')


# Import the necessary libraries.
library(tidyverse)
library(forecast)
library(tseries)


# Set your working directory.
# Import data set (FRED.csv) and assign to new object.
FRED <- read.csv('FRED.csv', header = T)
#FRED <- read.csv(file.choose(), header = T)


# Sense-check the new data set.
# The top six rows of the data frame.
head(FRED)


# The top 15 rows of the data frame.
head(FRED, 15)


# The bottom six rows of the data frame.
tail(FRED)


###############################################################################

# 2. Prepare the data.

# Specify the column, change the variables, and format the date.
# View the options available:
?strptime


# Based on the data, we will use the d/m/Y format.
FRED$DATE <- as.Date(FRED$DATE, format = '%d/%m/%Y')


# View the new data format.
head(FRED$DATE)
glimpse(FRED)

#######

# Change the names of columns by specifying the new column names.
colnames(FRED) <- c('date', 'index') 

# Return the top six rows.
head(FRED)


######

# Convert the data into a time series.
# Create a new data frame and assign time series value,
# and specify the 'ts' function.
FRED_ts <- ts(FRED$index,
              start = c(1972, 1),
              # Monthly frequency without missing values in data.
              frequency = 12)


# Sense-check the new object.
head(FRED_ts)  


###############################################################################

# 3. Visualise the data.


# Plot the time series.
plot(FRED_ts)


# View the data by creating a smaller sample of the visualisation.
plot(window(FRED_ts, 1972, 1974))


###############################################################################

# 4. Group the data by month.

# Specify the boxplot function and specific operands. 
boxplot(FRED_ts~cycle(FRED_ts))


# Add labels and titles.
boxplot(FRED_ts~cycle(FRED_ts),
        ylab = "index", 
        xlab = "month",
        main = "Confectionery production by month")


################################################################################

# 5. Decomposing the data.

# Extract and plot the main components to decompose the time series.
FRED_components <- decompose(FRED_ts)

# What is the object?
class(FRED_components)


# Determine the structure.
str(FRED_components)


# Visualise the decomposed time series.
plot(FRED_components) 


# Look at a single year (seasonal pattern) of the data.
plot(window(FRED_components$seasonal,
            c(1972, 1), c(1972, 12)))


# Plot the trend component.
plot(window(FRED_components$trend,
            c(2019, 1), c(2021, 12)))


# Test stationarity with augmented ADF test.
adf.test(FRED_ts)

# Review random time series variables.
FRED_components$random

# Plot values, and remove NA values while doing so.
autoplot(acf(na.remove(FRED_components$random), plot=FALSE)) + 
  # Add a title.
  labs(title="Randomness value") + 
  # Set the theme.
  theme_classic() 


# Plot random variables to check the distribution.
hist(FRED_components$random)


# Fit the model to our time series. 
arima_FRED_ts <- auto.arima(FRED_ts)

# Make a forecast for the next three months.
forecast3_FRED_ts <- forecast(arima_FRED_ts, 3)

# Plot the forecast on a graph.
autoplot(forecast3_FRED_ts) + theme_classic()

# Print the values in the data frame.
forecast3_FRED_ts


# Extend the prediction, set data source, time span, and assign a new object.
forecast2_FRED_ts <- forecast(arima_FRED_ts, 24)

# Plot the output, and set the theme. 
autoplot(forecast2_FRED_ts) + theme_classic()

# Print the values in the data frame.
forecast2_FRED_ts  


# Prediction for 10 years:
# Extend the prediction, set data source and time span, and assign a new object.
forecast2_FRED_ts_240 <- forecast(arima_FRED_ts, 240)

# Plot the output, and set the theme. 
autoplot(forecast2_FRED_ts_240) + theme_classic()

# Print the values in the data frame.
forecast2_FRED_ts_240 


# (Training data) Create a new time series object,
# and assign the values and parameters.
FRED_train_ts = window(FRED_ts,
                       start = c(1972, 1),
                       end = c(2020, 12),
                       frequency = 12)

# (Test data) Create a new time series object,
# and assign the values and parameters.
FRED_test_ts = window(FRED_ts,
                      start = c(2021, 1),
                      end = c(2021, 12),
                      frequency = 12)

# View new data frames.
head(FRED_train_ts)
head(FRED_test_ts)


# Create a new object,
# specify the forecast function, and pass the ARIMA model.
forecast_FRED_train_ts <- forecast(auto.arima(FRED_train_ts), 12)

# Plot the values and forecast and [4] add a theme:
autoplot(forecast_FRED_train_ts) + theme_classic()


# Add the autolayer(), and specify the data set and series name.
autoplot(forecast_FRED_train_ts) +
  autolayer(FRED_train_ts, series='Train') +
  autolayer(FRED_test_ts, series='Test') +
  theme_classic()


# Check the accuracy of the prediction.
accuracy(forecast_FRED_train_ts, FRED_test_ts)

###############################################################################

# 6. Save the R script.


##############################################################################