# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_5_files/Data') 

# Import tidyverse library and load the wage.csv file.
library(tidyverse) 

# Set your working directory.
# Import the data set, and store it in a data frame.
wages <- read.csv('wages_plots.csv', header=TRUE)

# Create a new data frame with individuals with wages of less than 300.
new_wages <- filter(wages, wage<300)  

# View the data frame.
head(new_wages)
dim(new_wages)

# Set data source and map the aes function to define x.
ggplot(new_wages, aes(x = marital)) +  
  # Add a geom layer to specify the plot type.
  geom_histogram(stat = 'count') 


# Specify the ggplot function.  
ggplot(new_wages, aes(x = marital)) +
  # Add fill, colour, and a statistic.
  geom_histogram(fill = 'red', color = 'black', stat = 'count') + 
  # Add the labs function for labels.
  labs(x = "Marital status",
       y = "Frequency",
       title = "Individuals by marital status") 


# Specify the ggplot function. 
ggplot(new_wages,
       # Specify 'y' to create a percentage. 
       aes(x = marital, y = ..count../sum(..count..))) +  
  # Specify attributes.
  geom_histogram(fill = 'red', color = 'black', stat = 'count') +
  # Specify titles.
  labs(x = "Marital status",
       y = "Percent",
       title = "Individuals by marital status") +  
  # Pass labels to the scale.
  scale_y_continuous(label = scales::percent) 



# Specify the ggplot function. 
ggplot(new_wages,
       # Specify 'y' to create a percentage. 
       aes(x = marital, y = ..count../sum(..count..))) +  
  # Specify attributes.
  geom_histogram(fill = 'red', color = 'black', stat = 'count') +
  # Specify titles.
  labs(x = "Marital status",
       y = "Percent",
       title = "Individuals by marital status") +  
  # Pass labels to the scale.
  scale_y_continuous(label = scales::percent) +
  # Flip the x-axis and y-axis.
  coord_flip()  


# Specify the ggplot function. 
# This is only an example. 

ggplot(new_wages, aes(x = age)) +
  geom_histogram(fill = 'blue', color = 'red', stat = 'count') + 
  labs(x = "Age in years",
       y = "Number of individuals",
       title = "Individuals by age group")


# Specify the ggplot function.
ggplot(new_wages, aes(x = age)) +
  # Specify the geom_density.
  geom_density() + 
  # Specify the title.
  labs(title = "Participants by age")


# Specify the ggplot function.
ggplot(new_wages, aes(x = age)) +
  # Add fill colour to the function.
  geom_density(fill = 'red', bw = 1) + 
  # Specify the title.
  labs(title = "Participants by age")


# Specify the ggplot function.
ggplot(new_wages, aes(x = age)) +
  geom_density(fill = 'green', bw = 5) + 
  labs(x = "AGE (YEARS)",
       y = "NUMBER OF INDIVIDUALS",
       title = "Individuals by age group",
       subtitle = "Bandwidth=5") +
  theme_classic()
