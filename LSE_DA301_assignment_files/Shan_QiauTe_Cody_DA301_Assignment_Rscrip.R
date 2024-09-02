## LSE Data Analytics Online Career Accelerator 

# DA301:  Advanced Analytics for Organisational Impact

###############################################################################

# Assignment template

## Scenario
## You are a data analyst working for Turtle Games, a game manufacturer and 
## retailer. They manufacture and sell their own products, along with sourcing
## and selling products manufactured by other companies. Their product range 
## includes books, board games, video games and toys. They have a global 
## customer base and have a business objective of improving overall sales 
##performance by utilising customer trends. 

## In particular, Turtle Games wants to understand:
## - how customers accumulate loyalty points (Week 1)
## - how useful are remuneration and spending scores data (Week 2)
## - can social data (e.g. customer reviews) be used in marketing 
##     campaigns (Week 3)
## - what is the impact on sales per product (Week 4)
## - the reliability of the data (e.g. normal distribution, Skewness, Kurtosis)
##     (Week 5)
## - if there is any possible relationship(s) in sales between North America,
##     Europe, and global sales (Week 6).

################################################################################

# Week 4 assignment: EDA using R

## The sales department of Turtle games prefers R to Python. As you can perform
## data analysis in R, you will explore and prepare the data set for analysis by
## utilising basic statistics and plots. Note that you will use this data set 
## in future modules as well and it is, therefore, strongly encouraged to first
## clean the data as per provided guidelines and then save a copy of the clean 
## data for future use.

# Instructions
# 1. Load and explore the data.
##  - Remove redundant columns (Ranking, Year, Genre, Publisher) by creating 
##      a subset of the data frame.
##  - Create a summary of the new data frame.
# 2. Create plots to review and determine insights into data set.
##  - Create scatterplots, histograms and boxplots to gain insights into
##      the Sales data.
##  - Note your observations and diagrams that could be used to provide
##      insights to the business.
# 3. Include your insights and observations.

###############################################################################

# Install and import Tidyverse.

# Install packages if you haven't already. 
#install.packages("tidyverse")
#install.packages("dplyr")
#install.packages("ggplot2", dependencies=TRUE)

library('tidyverse')
library(dplyr)
library(readxl)
library(ggplot2)

# Determine your working directory
getwd()

# Change your current directory.
#setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_assignment_files') 

# 1. Load and explore the data
turtle_sales <- read_csv("turtle_sales.csv")

# View the data frame.
View(turtle_sales)

# View columns and their type
glimpse(turtle_sales)

summary(turtle_sales)

# Create a new data frame from a subset of the sales data frame.
# Remove unnecessary columns. 

turtle_sales_clean <- select(turtle_sales, -Ranking, -Year, -Genre, -Publisher)


# View the data frame.
View(turtle_sales_clean)

glimpse(turtle_sales_clean)

# View the descriptive statistics.
summary(turtle_sales_clean)

# Count NA values per column
na_counts <- colSums(is.na(turtle_sales_clean))

# Display the results
na_counts

# Group the data and mean for all sales'
avg_sales_platform <- turtle_sales_clean %>%
  group_by(Platform) %>%
  summarize(
    Avg_EU_Sales = mean(EU_Sales),
    Avg_NA_Sales = mean(NA_Sales),
    Avg_Global_Sales = mean(Global_Sales)
  )

avg_sales_platform

# Group the data and sum for all sales'
sum_sales_platform <- turtle_sales_clean %>%
  group_by(Platform) %>%
  summarize(
    Sum_EU_Sales = sum(EU_Sales),
    Sum_NA_Sales = sum(NA_Sales),
    Sum_Global_Sales = sum(Global_Sales)
  ) 

sum_sales_platform

# sum for all sales'
sum_sales <- turtle_sales_clean %>%
  summarize(
    Sum_EU_Sales = sum(EU_Sales),
    Sum_NA_Sales = sum(NA_Sales),
    Sum_Global_Sales = sum(Global_Sales),
  )

sum_sales

################################################################################

# 2. Review plots to determine insights into the data set.

## 2a) Scatterplots
# Create scatterplots.
# Create a qplot for 'Sales' vs. 'Product' (scatter plot)

#Plots vs Product with Platform

qplot(x = EU_Sales, y = Product, colour=Platform, data = turtle_sales_clean, geom = c("point",'jitter'),
      xlab = "Sales EU", ylab = "Product",
      main = "Sales EU vs. Product")

qplot(x = NA_Sales, y = Product, colour=Platform, data = turtle_sales_clean, geom = c("point",'jitter'),
      xlab = "Sales NA", ylab = "Product",
      main = "Sales NA vs. Product")

qplot(x = Global_Sales, y = Product, colour=Platform, data = turtle_sales_clean, geom = c("point",'jitter'),
      xlab = "Sales Global", ylab = "Product",
      main = "Sales Global vs. Product")



## 2b) Histograms
# Create histograms.
# Create a qplot for the 'Sales' column (histogram)
plot(hist(turtle_sales_clean$EU_Sales))
plot(hist(turtle_sales_clean$NA_Sales))
plot(hist(turtle_sales_clean$Global_Sales))

qplot(x = EU_Sales, data = turtle_sales_clean, geom = "histogram", bins = 20,
      xlab = "Sales EU", ylab = "Frequency",
      main = "Distribution of EU Sales")

qplot(x = NA_Sales, data = turtle_sales_clean, geom = "histogram", bins = 20,
      xlab = "Sales NA", ylab = "Frequency",
      main = "Distribution of NA Sales")

qplot(x = Global_Sales, data = turtle_sales_clean, geom = "histogram", bins = 20,
      xlab = "Sales Global", ylab = "Frequency",
      main = "Distribution of Global Sales")


## 2c) Boxplots
# Create boxplots.
# Create a box plot using qplot

qplot(EU_Sales,
      Platform,
      color=Platform,
      data=turtle_sales_clean,
      geom='boxplot',
      xlab = "Sales EU", ylab = "Platform",
      main = "Distribution of EU Sales by Platform")

qplot(NA_Sales,
      Platform,
      color=Platform,
      data=turtle_sales_clean,
      geom='boxplot',
      xlab = "Sales NA", ylab = "Platform",
      main = "Distribution of NA Sales by Platform")

qplot(Global_Sales,
      Platform,
      color=Platform,
      data=turtle_sales_clean,
      geom='boxplot',
      xlab = "Sales Global in £m", ylab = "Platform",
      main = "Distribution of Global Sales by Platform")



###############################################################################

# 3. Observations and insights

## Your observations and insights here ......

# Popular products across regions are DS, GB, NES, PC and 3DS
# Global sales are outperforming on Wii, X360 and PS3 sales, while EU sales are selling high on Wii, PS3 and X360
# NA Sales are selling the most in X360, Wii and PS3
# Overall Global are selling 1878, NA 886 and EU 579, reflecting the market size
# The most popular products have the highest outliers across regions in sales
# EU sales are compared to NA sales more skewed towards high frequency on the lower end relativly
# NES sales are popular in NA and Global but not in EU
# GB and PS2 sales are popular in NA and Global but not in EU
# PS3 sales are very popular in EU compared to the other regions


###############################################################################
###############################################################################


# Week 5 assignment: Cleaning and maniulating data using R

## Utilising R, you will explore, prepare and explain the normality of the data
## set based on plots, Skewness, Kurtosis, and a Shapiro-Wilk test. Note that
## you will use this data set in future modules as well and it is, therefore, 
## strongly encouraged to first clean the data as per provided guidelines and 
## then save a copy of the clean data for future use.

## Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 4 assignment. 
##  - View the data frame to sense-check the data set.
##  - Determine the `min`, `max` and `mean` values of all the sales data.
##  - Create a summary of the data frame.
# 2. Determine the impact on sales per product_id.
##  - Use the group_by and aggregate functions to sum the values grouped by
##      product.
##  - Create a summary of the new data frame.
# 3. Create plots to review and determine insights into the data set.
##  - Create scatterplots, histograms, and boxplots to gain insights into 
##     the Sales data.
##  - Note your observations and diagrams that could be used to provide 
##     insights to the business.
# 4. Determine the normality of the data set.
##  - Create and explore Q-Q plots for all sales data.
##  - Perform a Shapiro-Wilk test on all the sales data.
##  - Determine the Skewness and Kurtosis of all the sales data.
##  - Determine if there is any correlation between the sales data columns.
# 5. Create plots to gain insights into the sales data.
##  - Compare all the sales data (columns) for any correlation(s).
##  - Add a trend line to the plots for ease of interpretation.
# 6. Include your insights and observations.

################################################################################

# Load necessary packages
library(dplyr)
library(readxl)
library(ggplot2)
library(stats)
library(moments)
library("BSDA")


# 1. Load and explore the data

# View data frame created in Week 4.

View(turtle_sales_clean)

head(turtle_sales_clean)

# Check output: Determine the min, max, and mean values.

# Create a function to calculate summary statistics for a column
calculate_summary <- function(column) {
  summary_stats <- c(
    Mean = mean(column),
    Median = median(column),
    SD = sd(column),
    Max = max(column),
    Min= min(column)
  )
  return(summary_stats)
}



# Apply the function to each subject's scores
EU_summary <- calculate_summary(turtle_sales_clean$`EU_Sales`)
NA_summary <- calculate_summary(turtle_sales_clean$`NA_Sales`)
Global_summary <- calculate_summary(turtle_sales_clean$`Global_Sales`)


# View the descriptive statistics.

EU_summary
NA_summary
Global_summary

summary(turtle_sales_clean$`EU_Sales`)
summary(turtle_sales_clean$`NA_Sales`)
summary(turtle_sales_clean$`Global_Sales`)


###############################################################################

# 2. Determine the impact on sales per product_id.

## 2a) Use the group_by and aggregate functions.
# Group data based on Product and determine the sum per Product.
# Group data by Product
sales_product <- turtle_sales_clean %>%
  group_by(Product) %>%
  summarize(
    Sum_EU_Sales = sum(EU_Sales),
    Sum_NA_Sales = sum(NA_Sales),
    Sum_Global_Sales = sum(Global_Sales),
  )

# View the data frame.
View(sales_product)

# Explore the data frame.
summary(sales_product)
glimpse(sales_product)
dim(sales_product)

#Create a Report
DataExplorer::create_report(sales_product)


## 2b) Determine which plot is the best to compare game sales.
# Create scatterplots.

# EU Sales
ggplot(data=sales_product, mapping=aes(x = Sum_EU_Sales, y = Product,
                                   colour = Product)) +
  # Change 'alpha' values.
  geom_point(alpha = 1, size = 3) +  
  # Specify preloaded colour.
  scale_fill_brewer('set2')+
  labs(title = "EU Sales by Product",
       x = "EU Sales",
       y = "Product")

# NA Sales
ggplot(data=sales_product, mapping=aes(x = Sum_NA_Sales, y = Product,
                                       colour = Product)) +
  # Change 'alpha' values.
  geom_point(alpha = 1, size = 3) +  
  # Specify preloaded colour.
  scale_fill_brewer('set2') +
  labs(title = "NA Sales by Product",
     x = "NA Sales",
     y = "Product")

# Global Sales
ggplot(data=sales_product, mapping=aes(x = Sum_Global_Sales, y = Product,
                                       colour = Product)) +
  # Change 'alpha' values.
  geom_point(alpha = 1, size = 3) +  
  # Specify preloaded colour.
  scale_fill_brewer('set2') +
  labs(title = "Global Sales by Product",
       x = "Global Sales",
       y = "Product")

# Create histograms.

# EU Sales
ggplot(sales_product, aes(x = `Sum_EU_Sales`)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "EU Sales Distribution", x = "EU Sales") +
  theme_minimal()

# NA Sales
ggplot(sales_product, aes(x = `Sum_NA_Sales`)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "NA Sales Distribution", x = "NA Sales") +
  theme_minimal()

# Global Sales
ggplot(sales_product, aes(x = `Sum_Global_Sales`)) +
  geom_histogram(binwidth = 5, fill = "lightblue", color = "black") +
  labs(title = "Global Sales Distribution", x = "Global Sales") +
  theme_minimal()


# Create boxplots.

ggplot(sales_product, aes(y=Sum_EU_Sales)) +
  geom_boxplot()

ggplot(sales_product, aes(y=Sum_NA_Sales)) +
  geom_boxplot()

ggplot(sales_product, aes(y=Sum_Global_Sales)) +
  geom_boxplot()

ggplot(sales_product, aes(x=Sum_EU_Sales, y=Product)) +
  geom_boxplot()

ggplot(sales_product, aes(x=Sum_NA_Sales, y=Product)) +
  geom_boxplot()

ggplot(sales_product, aes(x=Sum_Global_Sales, y=Product)) +
  geom_boxplot()

ggplot(sales_product, aes(x = Product, y = Sum_EU_Sales)) +
  # Specify the geom_violin function and fill.
  geom_violin(fill = 'grey') +  
  # Specify the geom_boxplot.
  geom_boxplot(fill = 'lightblue', width = 0.25,
               outlier.color = 'lightblue', outlier.size = 1,
               outlier.shape = 'square')  

ggplot(sales_product, aes(x = Product, y = Sum_NA_Sales)) +
  # Specify the geom_violin function and fill.
  geom_violin(fill = 'grey') +  
  # Specify the geom_boxplot.
  geom_boxplot(fill = 'lightblue', width = 0.25,
               outlier.color = 'lightblue', outlier.size = 1,
               outlier.shape = 'square')  

ggplot(sales_product, aes(x = Product, y = Sum_Global_Sales)) +
  # Specify the geom_violin function and fill.
  geom_violin(fill = 'grey') +  
  # Specify the geom_boxplot.
  geom_boxplot(fill = 'lightblue', width = 0.25,
               outlier.color = 'lightblue', outlier.size = 1,
               outlier.shape = 'square')  


###############################################################################


# 3. Determine the normality of the data set.

## 3a) Create Q-Q Plots
# Create Q-Q Plots.
# Extract the Sales
EU_Sales <- sales_product$`Sum_EU_Sales`
NA_Sales <- sales_product$`Sum_NA_Sales`
Global_Sales <- sales_product$`Sum_Global_Sales`

# 1. Q-Q Plot to Determine Normality
# Create a Q-Q plot
qqnorm(EU_Sales, main = "Q-Q Plot of EU Sales")
qqline(EU_Sales, col = 2)  # Add a reference line


qqnorm(NA_Sales, main = "Q-Q Plot of NA Sales")
qqline(NA_Sales, col = 2)  # Add a reference line


qqnorm(Global_Sales, main = "Q-Q Plot of Global Sales")
qqline(Global_Sales, col = 2)  # Add a reference line


## 3b) Perform Shapiro-Wilk test
# Install and import Moments.


# Perform Shapiro-Wilk test.
shapiro_test_EU <- shapiro.test(EU_Sales)
print(shapiro_test_EU)
shapiro_test_NA <- shapiro.test(NA_Sales)
print(shapiro_test_NA)
shapiro_test_Global <- shapiro.test(Global_Sales)
print(shapiro_test_Global)


## 3c) Determine Skewness and Kurtosis
# Skewness and Kurtosis.

calculate_skew_kurt <- function(column) {
  summary <- c(
    Skewness = round(skewness(column), 2),
    Kurtosis = round(kurtosis(column), 2),
    Shapiro = round(shapiro.test(column)$p.value, 2)
  )
  return(summary)
}

#Assign values
EU_skew_kurt <- calculate_skew_kurt(EU_Sales)
NA_skew_kurt <- calculate_skew_kurt(NA_Sales)
Global_skew_kurt <- calculate_skew_kurt(Global_Sales)

#Print
print(EU_skew_kurt)
print(NA_skew_kurt)
print(Global_skew_kurt)



## 3d) Determine correlation
# Determine correlation.
# Pearson's correlation between math and reading scores
cor_sales_EU_Global <- cor(sales_product$`Sum_EU_Sales`, sales_product$`Sum_Global_Sales`,)
cor_sales_EU_Global

cor_sales_NA_Global <- cor(sales_product$`Sum_NA_Sales`, sales_product$`Sum_Global_Sales`,)
cor_sales_NA_Global


###############################################################################

# Group By Multiple Columns
grouped_total_sales <- turtle_sales %>%
  group_by(Publisher, Year, Genre,Platform,Product) %>%
  summarize(
    EU_Sales = sum(EU_Sales),
    NA_Sales = sum(NA_Sales),
    Global_Sales = sum(Global_Sales),
  )

View(grouped_total_sales)


# Count NA values per column
na_counts <- colSums(is.na(grouped_total_sales))

# Display the results
na_counts

# Find NA Values
# Assuming grouped_total_sales is your data frame
rows_with_na <- subset(grouped_total_sales, apply(grouped_total_sales, 1, function(row) any(is.na(row))))

# Print the rows with missing values
print(rows_with_na)
                     
# Assign year based on similar Product sales in the same year for 948

#grouped_total_sales$Year[which(is.na(grouped_total_sales$Year))] <- 2010

grouped_total_sales$Year[which(grouped_total_sales$Product == 948 & is.na(grouped_total_sales$Year))] <- 2010
grouped_total_sales$Year[which(grouped_total_sales$Product == 7141 & is.na(grouped_total_sales$Year))] <- 2003

View(grouped_total_sales)

# 4. Plot the data
# Create plots to gain insights into data.
# Choose the type of plot you think best suits the data set and what you want 
# to investigate. Explain your answer in your report.

#Boxplot
ggplot(grouped_total_sales, aes(x = EU_Sales, y = Platform)) +
  # Specify the geom_boxplot.
  geom_boxplot(fill = 'lightblue', width = 0.25,
               outlier.color = 'lightblue', outlier.size = 1,
               outlier.shape = 'square')  


#Scatterplot
ggplot(data=grouped_total_sales, mapping=aes(x = EU_Sales, y = Publisher,
                                       colour = Genre)) +
  # Change 'alpha' values.
  geom_point(alpha = 1, size = 3) +  
  # Specify preloaded colour.
  scale_fill_brewer('set2')+
  labs(title = "EU Sales by Publisher and Genre",
       x = "EU Sales",
       y = "Publisher")

ggplot(data=grouped_total_sales, mapping=aes(x = NA_Sales, y = Publisher,
                                                    colour = Genre)) +
  # Change 'alpha' values.
  geom_point(alpha = 1, size = 3) +  
  # Specify preloaded colour.
  scale_fill_brewer('set2')+
  labs(title = "NA Sales by Publisher and Genre",
       x = "NA Sales",
       y = "Publisher")

ggplot(data=grouped_total_sales, mapping=aes(x = Global_Sales, y = Publisher,
                                                    colour = Genre)) +
  # Change 'alpha' values.
  geom_point(alpha = 1, size = 3) +  
  # Specify preloaded colour.
  scale_fill_brewer('set2')+
  labs(title = "Globa Sales by Publisher and Genre",
       x = "Global Sales",
       y = "Publisher")


# Create a bar plot of Sum_All_Sales by Year
ggplot(grouped_total_sales, aes(x = Year, y = Global_Sales)) +
  geom_bar(stat = "identity") +
  labs(x = "Year", y = "Sum of All Sales") +
  ggtitle("Sum of All Sales by Year")



# Genre by the years
ggplot(grouped_total_sales, aes(x=Year, y=Global_Sales, col=Genre)) + 
  geom_smooth(se=FALSE)

# Platform by the years
ggplot(grouped_total_sales, aes(x=Year, y=Global_Sales, col=Platform)) + 
  geom_smooth(se=FALSE)

# Product by the years
ggplot(grouped_total_sales, aes(x=Year, y=EU_Sales, col=Product)) + 
  geom_point() + geom_smooth() +
  theme_minimal() +
  labs(title = "Scatterplot for EU Sales vs Product",
       x = "Year",
       y = "EU sales in £m")

ggplot(grouped_total_sales, aes(x=Year, y=NA_Sales, col=Product)) + 
  geom_point() + geom_smooth() +
  theme_minimal() +
  labs(title = "Scatterplot for NA Sales vs Product",
       x = "Year",
       y = "NA sales in £m")

ggplot(grouped_total_sales, aes(x=Year, y=Global_Sales, col=Product)) + 
  geom_point() + geom_smooth() +
  theme_minimal() +
  labs(title = "Scatterplot for Global Sales vs Product",
       x = "Year",
       y = "Global sales in £m")


# Barcharts by different categories
ggplot(grouped_total_sales, aes(x = Year, y = Global_Sales, fill= Platform)) +
  geom_bar(stat = "identity") +
  labs(x = "Year", y = "Global Sales in £m") +
  ggtitle("Global Sales by Year and Platform")

ggplot(grouped_total_sales, aes(x = Year, y = Global_Sales, fill= Product)) +
  geom_bar(stat = "identity") +
  labs(x = "Year", y = "Global Sales in £m") +
  ggtitle("Global Sales by Year and Product")

ggplot(grouped_total_sales, aes(x = Year, y = Global_Sales, fill= Genre)) +
  geom_bar(stat = "identity") +
  labs(x = "Year", y = "Global Sales in £m") +
  ggtitle("Global Sales by Year and Genre")

ggplot(grouped_total_sales, aes(x = Year, y = EU_Sales, fill= Genre)) +
  geom_bar(stat = "identity") +
  labs(x = "Year", y = "EU Sales in £m") +
  ggtitle("EU Sales by Year and Genre")

ggplot(grouped_total_sales, aes(x = Year, y = NA_Sales, fill= Genre)) +
  geom_bar(stat = "identity") +
  labs(x = "Year", y = "NA Sales in £m") +
  ggtitle("NA Sales by Year and Genre")



###############################################################################

# 5. Observations and insights
# Your observations and insights here...



###############################################################################
###############################################################################

# Week 6 assignment: Making recommendations to the business using R

## The sales department wants to better understand if there is any relationship
## between North America, Europe, and global sales. Therefore, you need to
## investigate any possible relationship(s) in the sales data by creating a 
## simple and multiple linear regression model. Based on the models and your
## previous analysis (Weeks 1-5), you will then provide recommendations to 
## Turtle Games based on:
##   - Do you have confidence in the models based on goodness of fit and
##        accuracy of predictions?
##   - What would your suggestions and recommendations be to the business?
##   - If needed, how would you improve the model(s)?
##   - Explain your answers.

# Instructions
# 1. Load and explore the data.
##  - Continue to use the data frame that you prepared in the Week 5 assignment. 
# 2. Create a simple linear regression model.
##  - Determine the correlation between the sales columns.
##  - View the output.
##  - Create plots to view the linear regression.
# 3. Create a multiple linear regression model
##  - Select only the numeric columns.
##  - Determine the correlation between the sales columns.
##  - View the output.
# 4. Predict global sales based on provided values. Compare your prediction to
#      the observed value(s).
##  - NA_Sales_sum of 34.02 and EU_Sales_sum of 23.80.
##  - NA_Sales_sum of 3.93 and EU_Sales_sum of 1.56.
##  - NA_Sales_sum of 2.73 and EU_Sales_sum of 0.65.
##  - NA_Sales_sum of 2.26 and EU_Sales_sum of 0.97.
##  - NA_Sales_sum of 22.08 and EU_Sales_sum of 0.52.
# 5. Include your insights and observations.

###############################################################################

# 1. Load and explor the data
# View data frame created in Week 5.
View(sales_product)


# Determine a summary of the data frame.
glimpse(sales_product)
dim(sales_product)
summary(sales_product)
head(sales_product)

###############################################################################

# 2. Create a simple linear regression model
## 2a) Determine the correlation between columns
# Create a linear regression model on the original data.
model_EU <- lm(sales_product$Sum_Global_Sales ~ sales_product$Sum_EU_Sales)
model_NA <- lm(sales_product$Sum_Global_Sales ~ sales_product$Sum_NA_Sales)

# View the summary stats.
summary(model_EU)
summary(model_NA)

## 2b) Create a plot (simple linear regression)
# Basic visualisation.
# Create a visualisation to determine normality of data set.
qqnorm(residuals(model_EU))
qqline(residuals(model_EU), col='red')

qqnorm(residuals(model_NA))
qqline(residuals(model_NA), col='blue')

plot(sales_product$Sum_EU_Sales, sales_product$Sum_Global_Sales, 
     main="EU Sales vs. Global Sales", 
     xlab="EU Sales in £m", 
     ylab="Global Sales in £m")
abline(coefficients(model_EU), col='red')


plot(sales_product$Sum_NA_Sales, sales_product$Sum_Global_Sales, 
     main="NA Sales vs. Global Sales", 
     xlab="NA Sales in £m", 
     ylab="Global Sales in £m")
abline(coefficients(model_NA), col='blue')


###############################################################################


# 3. Create a multiple linear regression model
# Select only numeric columns from the original data frame.
sales <- select(sales_product, -Product)
View(sales)

#Check na values
sum(is.na(sales))

# Multiple linear regression model.
model1 = lm(Sum_Global_Sales~Sum_EU_Sales+Sum_NA_Sales, data=sales)


# Print the summary statistics.
summary(model1)


# Create a data frame for prediction with sample data
prediction_data <- data.frame(Sum_EU_Sales = c(23.80, 1.56, 0.65, 0.97, 0.52), Sum_NA_Sales = c(34.02, 3.93, 2.73, 2.26, 22.08))

# Predict sales for the specified prediction values
predictions <- predict(model1, newdata = prediction_data)

# Add the predicted values to the prediction_data data frame
prediction_data$Predicted_Global_Sales <- predictions

# View the predictions
print(prediction_data)



###############################################################################

# 4. Predictions based on given values



# Define the values you want to filter for
values_to_filter <- c(23.80, 1.56, 0.65, 0.97, 0.52)

# Filter rows where "column_name" contains any of the specified values
filtered_df <- sales[sales$Sum_EU_Sales %in% values_to_filter, ]

# Compare with observed values for a number of records.
print(prediction_data)
print(filtered_df)





###############################################################################

# 5. Observations and insights
# Your observations and insights here...



###############################################################################
###############################################################################




