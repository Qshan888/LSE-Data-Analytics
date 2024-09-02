# LSE Data Analytics Online Career Accelerator
# DA301: Advanced Analytics for Organisational Impact

# Practical activity: Wrangling raw data

###############################################################################
# This is the solution to the practical activity

# In this activity, you will apply what you have learned about string 
# manipulation, continuing with the Insurance-4-You (I4U) case study but using
# a new data set. 

# Ryan is still working on the new car insurance product for I4U. To ensure
# members get a well-rounded product with excellent benefits, Callan Lee asked
# Ryan to consider whether a historical police data set might be useful to
# inform the new insurance product.

# In order to complete the tasks Ryan has given you, you decide on the 
# following plan of action: 
# - Import the CSV file (police.csv) into RStudio.
# - Explore and sense-check the data set.
# - Perform data manipulation.
# - Perform string manipulation.
# - Answer the following questions based on the police reports:
#    - How many offences were suspicious compared to traffic?
#    - How many offences were gender based?
#    - How do the neighbourhoods compare?
#    - Is the number of occurrences (problems and traffic) gender based?
#    - What is the total number of occurrences per neighbourhood?.

###############################################################################

# 1. Prepare your workstation

# Import the necessary libraries.
library(tidyverse)
# Create insightful summaries of data set.
library(skimr)
# Create insightful reports of data set.
library(DataExplorer)


# Set your working directory.
# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_5_files/Data') 
# Import the police.csv file.
police <- read.csv('police.csv', header=T)
police <- read.csv(file.choose(), header=T)


# View the data frame.
as_tibble(police)
dim(police)

View(police)


##############################################################################

# 2. Explore the data set

# Determine if there are missing values. 
police[is.na(police)] 
sum(is.na(police))


# Delete all the records with missing values.
police_new <-na.omit(police)


# View the result.
head(police_new)
dim(police_new)
sum(is.na (police_new))


# Determine the descriptive statistics.
summary(police_new)

DataExplorer::create_report(police_new)


##############################################################################

# 3. Data manipulation

# Drop unnecessary columns.
police_df <- select(police_new, -c('X', 'idNum', 'date', 'MDC', 'preRace',
                                   'race', 'lat', 'long', 'policePrecinct',
                                   'citationIssued', 'personSearch', 
                                   'vehicleSearch'))

# View the result.
colnames(police_df)
dim(police_df)
 

# Rename column names with first letter to uppercase.
names(police_df) <- str_to_title(names(police_df))

# View the result.
colnames(police_df)
View(police_df)


# Determine the unique values in each column
unique(police_df$Problem)

unique(police_df$Gender)

unique(police_df$Neighborhood)


###############################################################################

# 4. Visualise data

# Create barplots.
# How many offences were suspicious compared to traffic?
barplot(table(police_df$Problem),
        main='Police reports',
        xlab='Offense',
        ylab='Count',
        col='red')


# How many offences were gender based?
barplot(table(police_df$Gender),
        main='Police reports',
        xlab='Gender',
        ylab='Count',
        col='blue')


# How do the neighbourhoods compare?
barplot(table(police_df$Neighborhood),
        main='Police reports',
        xlab='Neighbourhood',
        ylab='Count',
        col='green')


###############

# Is the number of occurrences (problems and traffic) gender based?
# Determine the number of occurrences for gender and problems.
table(police_df$Gender)            
table(police_df$Problem)
table(police_df$Neighborhood)
table(police_df)

###############

# Determine only females with traffic.
nrow(subset(police_df,
            Gender=='Female' & Problem=='traffic'))


# Determine only males with traffic.
nrow(subset(police_df, Gender=='Male' & Problem=='traffic'))


###############

# What is the total number of occurrences per neighbourhood?
# Determine neighbourhoods with occurrences.
police_df %>% 
  count(Neighborhood, sort=T)


###############################################################################

# 5. Save your R script

##############################################################################