
# Set your working directory. 
# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_5_files/Data') 


# Import tidyverse.
library(tidyverse)

# Set your working directory.
# Import the data set (wages_plots.csv).
wages <- read.csv('wages_plots.csv', header = TRUE)

# View the data frame.
summary(wages)
head(wages)
dim(wages)
glimpse(wages)

# Keep only the necessary columns.
wages_fin <- select(wages, age, wage, education, job_class)

# View the data frame.
head(wages_fin)
dim(wages_fin)

# Example to get help in RStudio.
?ggplot()
?aes()
# You can replace the ggplot() and aes() with any function to get more information.

# Build a plot: Start with data, mapping, and geom.
# Set the data source; add mapping elements.
ggplot (data = wages_fin, 
        # Add mapping elements.
        # Insert a + to add the geom.
        mapping=aes(x = age, y = wage)) +
  
  # Add a geom as point for the scatterplot.
  # Set the colour to red.
  geom_point(color = 'red',
             # Set the alpha transparency to 0.5.
             alpha = 0.5,  
             # Set the point size to 1.5.
             size = 1.5) 

# Scatterplot to indicate relation between age and wage
ggplot(data = wages_fin,
       mapping = aes(x = age, y = wage)) +
  geom_point(color = 'red', alpha = 0.5, size = 1.5) +
  
  # Add the line of best fit to the plot.
  geom_smooth(method = 'lm')



# Scatterplot to indicate relation between age, wage, and education
ggplot(data = wages_fin,
       mapping = aes(x = age, y = wage,
                     # Specify 'color'.
                     color = education)) +  
  
  # Remove the colour argument.
  geom_point(alpha = 0.5, size = 1.5) +  
  
  #Add lines of best fit, remove the confidence intervals,
  # and set the size.
  geom_smooth(method = 'lm',
              se = FALSE,
              size = 1.5) 



# Scatterplot to indicate relation between age, wage, and education
ggplot(data = wages_fin,
       mapping = aes(x = age, y = wage, color = education)) +
  geom_point(alpha = 0.5, size = 1.5) +
  geom_smooth(method = 'lm', se = FALSE, size = 1.5) +
  
  # Add a scale layer for x.
  scale_x_continuous(breaks = seq(0, 90, 5)) +  
  
  # Add a scale layer for y.
  scale_y_continuous(breaks = seq(0, 350, 50))


# Scatterplot to indicate relation between age, wage, and education
ggplot(data = wages_fin,
       mapping = aes(x = age, y = wage, color = education)) +
  geom_point(alpha = 0.5, size = 1.5) +
  geom_smooth(method = 'lm', se = FALSE, size = 1.5) +
  
  # Add argument/title (x).
  scale_x_continuous(breaks = seq(0, 90, 5),
                     "Age of the Individual") + 
  
  # Add argument/title (y).
  scale_y_continuous(breaks = seq(0, 350, 50),
                     "Wage in $1000s") +  
  
  # Add layer (colours).
  scale_color_manual(values = c('red', 'blue',
                                'green', 'orange',
                                'yellow'))


# Scatterplot to indicate relation between age, wage, 
# education, and job_class 
ggplot(data = wages_fin,
       mapping = aes(x = age, y = wage, color = education)) +
  geom_point(alpha = 0.5, size = 1.5) +
  geom_smooth(method = 'lm', se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 90, 5), "Age of the Individual") +
  scale_y_continuous(breaks = seq(0, 350, 50), "Wage in $1000s") +
  scale_color_manual(values = c('red', 'blue', 'green', 'orange', 'yellow')) +
  
  # Add a facet layer.
  facet_wrap(~job_class) 


# Scatterplot to indicate relation between age, wage, 
# education, and job_class 
ggplot(data = wages_fin,
       mapping = aes(x = age, y = wage, color = education)) +
  geom_point(alpha = 0.5, size = 1.5) +
  geom_smooth(method = 'lm', se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 90, 5), "Age of the Individual") +
  scale_y_continuous(breaks = seq(0, 350, 50), "Wage in $1000s") +
  scale_color_manual(values = c('red', 'blue', 'green', 'orange', 'yellow')) +
  facet_wrap(~job_class) +
  
  # Add labels for title, subtitle, and caption.
  labs(title = "Relationship between wages and age",
       subtitle = "Survey from the mid-Atlantic region, USA",
       caption = "Source: US govt data") 


# Scatterplot to indicate relation between age, wage, 
# education, and job_class 
ggplot(data = wages_fin,
       mapping = aes(x = age, y = wage, color = education)) +
  geom_point(alpha = 0.5, size = 1.5) +
  geom_smooth(method = 'lm', se = FALSE, size = 1.5) + 
  scale_x_continuous(breaks = seq(0, 90, 5)) +
  scale_y_continuous(breaks = seq(0, 350, 50)) +
  scale_color_manual(values = c('red', 'blue', 'green', 'orange', 'yellow')) +
  facet_wrap(~job_class) +
  labs(title = "Relationship between wages and age",
       subtitle = "Survey from the mid-Atlantic region, USA",
       #  Add labels to labs function.
       caption = "Source: US govt data",
       x = "Individuals' Age",
       y = "Wage in $ (x1000)",
       color = "Education Level") +
  
  # Add a theme layer. 
  theme_bw()  