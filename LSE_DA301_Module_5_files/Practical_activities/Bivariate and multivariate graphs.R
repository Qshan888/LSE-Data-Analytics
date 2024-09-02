# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_5_files/Data') 


# Import the tidyverse library.
library(tidyverse)

# Set your working directory.
# Import the wages_plots.csv file. Set your Working Directory.
wages <- read.csv('wages_plots.csv', header = TRUE)

# Create a new data frame without outliers.
new_wages <- filter(wages, wage < 300)

# View the data frame.
head(new_wages)
dim(new_wages)



# Specify the ggplot function.
# Set data source, set x-variable, and pass x. 
ggplot(new_wages, aes(x = education, fill = job_class)) +  
  # Specify the geom_bar function.
  geom_bar()


# Specify the ggplot function.
ggplot(new_wages, aes(x = education, fill = job_class)) +  
  # Specify the geom_bar function.
  # Add position.
  geom_bar(position = 'fill') +  
  # Add a label to y.
  labs(y = 'Proportion') 


# Specify the ggplot function.
ggplot(new_wages, aes(x = education, fill = job_class)) +  
  # Specify the geom_bar function.
  # Add position.
  geom_bar(position = 'dodge') +  
  # Change fill colours.
  scale_fill_manual(values=c('blue', 'dark green'))


# Possible solution:
ggplot(new_wages, aes(x = education, fill = job_class)) +  
  geom_bar(position='dodge') +  
  scale_fill_manual(values = c('purple', 'yellow')) +
  scale_y_continuous(breaks = seq(0, 350, 50), "Number of individuals") +
  labs(title = "Number of individuals per educational level",
       x = "EDUCATION")


# Specify the ggplot function.
# Set the data source, set and pass x. 
ggplot(new_wages, aes(x = education, y = wage)) +
  # Specify the geom_boxplot function.
  geom_boxplot()  

# Specify the ggplot function.
# Set the data source, set and pass x. 
ggplot(new_wages, aes(x = education, y = wage)) +
  # Specify the geom_boxplot function.
  geom_boxplot(fill = 'red', notch = TRUE, outlier.color = 'red') +
  # Specify the titles.
  labs(title = "Wages by education level") +  
  # Add a 'minimal' theme.
  theme_minimal()  

# Specify the ggplot function.
# Set data source, pass x and y variables.
ggplot(new_wages, aes(x = education, y = wage)) +
  # Specify the geom_violin function.
  geom_violin()

# Specify the ggplot function.
# Set data source, pass x and y variables.
ggplot(new_wages, aes(x = education, y = wage)) +
  # Specify the geom_violin function and fill.
  geom_violin(fill = 'red') +  
  # Specify the geom_boxplot.
  geom_boxplot(fill = 'green', width = 0.25,
               outlier.color = 'green', outlier.size = 1,
               outlier.shape = 'square')  

# Possible solution:
ggplot(new_wages, aes(x = education, y = wage)) +
  # Specify the geom_violin function and fill.
  geom_violin(fill = 'blue') +  
  # Specify the geom_boxplot.
  geom_boxplot(fill = 'green', width = 0.25,
               outlier.color = 'green', outlier.size = 1,
               outlier.shape = 'square') +
  # Specify the titles.
  labs(title = "Wage by educational level",
       x = "EDUCATION",
       y = "WAGE")


# Add 'shape=job_class' (assigns shapes to data points)
# and remove the line of best fit.
ggplot(data=new_wages, mapping=aes(x = age, y = wage,
                                   colour = education,
                                   shape = job_class)) +
  # Change 'alpha' values.
  geom_point(alpha = 1, size = 3) +  
  scale_x_continuous(breaks = seq(0, 90, 5), "Age of the Individual") +
  scale_y_continuous(breaks = seq(0, 350, 50), "Wage in $1000s") +
  # Specify preloaded colour.
  scale_fill_brewer('set2')

