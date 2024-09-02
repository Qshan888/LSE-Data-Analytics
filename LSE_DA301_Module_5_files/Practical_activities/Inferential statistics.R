# Set your working directory.
# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_5_files/Data') 

# Import the necessary packages.
library (tidyverse) 
library (moments)

# Set your working directory.
# Import and view the data (drive_thru.csv).
drive1 <- read.csv('drive_thru.csv', header=TRUE) 

View(drive1)  
summary(drive1)
dim(drive1)

# Assign data to the object, and remove the 'number' column.
drive2 <- select(drive1, -n) 

# Round the values to two decimal places.
drive3 <- round(drive2, digits=2)

# Convert the data set into a tibble.
head(drive3)

# Determine the summary statistics.
summary(drive3)

# Specify the qqnorm function.
# Draw a qqplot using the total_seconds data.
qqnorm(drive3$total_seconds,
       col='blue',
       xlab="z Value",
       ylab='Time')

# Specify the qqline function.
# Add a reference line to the qqplot.
qqline(drive3$total_seconds,
       col='red',
       lwd=2) 

# Run a Shapiro-Wilk test.
shapiro.test(drive3$total_seconds)

# Specify the skewness and kurtosis functions.
skewness(drive3$total_seconds) 
kurtosis(drive3$total_seconds)


# Specify the t.test function.
# Set the data source, the confidence interval (95%),
# and the theoretical mean.  

t.test(drive3$total_seconds,
       conf.level=0.95,
       mu=120)

# Run a Shapiro-Wilk test.
shapiro.test(drive3$car_stop)
shapiro.test(drive3$car_go)
shapiro.test(drive3$take_order)
shapiro.test(drive3$hand_over_order)

# Specify the cor function.
# Set the first and second variables.

cor(drive3$car_stop, drive3$car_go)
cor(drive3$take_order, drive3$hand_over_order) 

#The four values are all greater than 0.05, indicating the data is normally distributed.

# Determine the correlation for the whole data frame.
round (cor(drive3),
       digits=2)