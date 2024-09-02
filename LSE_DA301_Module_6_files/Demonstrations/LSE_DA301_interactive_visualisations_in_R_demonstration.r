# LSE Data Analytics Online Career Accelerator

# DA301: Advanced Analytics for Organisational Impact

# Demonstration video: Interactive visualisations in R

###############################################################################

# This R script accompanies the demonstration video on how to run
# create interactive visualisations in R. 
#
# In this video, you'll learn:
#  - how to build a simple linear regression model in R
#  - how to perform log transformation on variables to improve model fit
#  - how to test the efficiency of regression models and make predictions.

###############################################################################

# 1. Prepare your workstation
# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_6_files/Data') 

# Install the package.
install.packages('plotly')

# Import the libraries.
library(plotly)
library(tidyverse)


# Import the built-in motor cars data set.
# Assign a data frame name to the data set (mtcars).
cars <- mtcars


# View the object (data) type.
typeof(cars)


###############################################################################

# 2. Explore the data

# Convert the data set to a data frame.
cars_df <- as.data.frame(cars)


# Sense-check the data viewing the top six rows.
head(cars_df)


###############################################################################

# 3. Create interactive visualisations

# 3a) Weight (wt) and miles per gallon (mpg)

# Use plotly to create a plot with one variable.
# Note the spelling of the function (plot_ly).
# Specify the data frame and the x variable.
plot_ly(cars_df,
        x = ~wt)


###########


# 3b) Add a y-variable to the plot

# Add another variable (y) and select a plot type - barplot.
plot_ly(cars_df,
        x = ~wt,
        y = ~mpg,
        type = 'bar')



# What if we don't specify the plot type?
# With two variables, allow plotly to select the chart type.
plot_ly(cars_df,
        x = ~wt,
        y = ~mpg)


##########

# 3c) Add a third variable to the plot

# Add a third variable as colour to the scatterplot - cylinder (cyl).
# Specify the mode as markers and color as cyl.
plot_ly(cars_df,
        x = ~wt,
        y = ~mpg,
        type = 'scatter',
        mode = 'markers',
        color = ~cyl)



# Convert the cylinder variables to categorical values (factors).
plot_ly(cars_df,
        x = ~wt,
        y = ~mpg,
        type = 'scatter',
        mode = 'markers',
        color = ~factor(cyl))


###############################################################################

# 4. Advanced features

# 4a) Colour blindness

# Add symbols to the plot for clear distinction.
plot_ly(cars_df,
        x = ~wt,
        y = ~mpg,
        type = 'scatter',
        mode = 'markers',
        color = ~factor(cyl),
        symbol = ~cyl,
        symbols = c('circle', 'x', 'o'))



# Increase  the symbol size and transparency.
plot_ly(cars_df,
        x = ~wt,
        y = ~mpg,
        type = 'scatter',
        mode = 'markers',
        color = ~factor(cyl),
        symbol = ~cyl,
        symbols = c('circle', 'x', 'o'),
        size = 2,
        alpha = 1)


###########

# 4b) 3D plots

# Create a 3D plot with an x, y, and z-axis.
plot_ly(cars_df,
        x = ~wt,
        y = ~mpg,
        z = ~cyl,
        color = ~factor(gear))


##########

# 4c) Create an animated scatterplot

# Create an animated scatter plot using cylinder in the frame parameter.
plot_ly(cars_df,
        x = ~wt,
        y = ~mpg,
        type = 'scatter',
        mode = 'markers',
        frame = ~cyl,
        showlegend = FALSE)



# Assign the animated plot to the object viz.
viz <- plot_ly(cars_df,
               x = ~wt,
               y = ~mpg,
               type = 'scatter',
               mode = 'markers',
               frame = ~cyl,
               showlegend = FALSE)


#########

# 4d) Edit animation features

# Edit and alter animation features, such as the button,
# slider, and transitions.
  viz %>%
  animation_button(x =1 , xanchor = 'right',
                   y = 1, yanchor = 'bottom')%>% 
  animation_slider(currentvalue = list(prefix = 'Cylinders',
                                       font = list(color = 'blue'))) %>% 
  animation_opts(frame = 10000,
                 easing = 'circle-in')


# Import the tidyverse.
library (tidyverse)  

# Import the data set (wages_plots.csv).
wages <- read.csv ('wages_plots.csv', header=T)

# Create a scatterplot with ggplot().
# Assign an object 'plot', specify the data frame,
# specify the variables and the geom type.
plot <- ggplot(data=wages,
               mapping=aes(x=age, y=wage)) +
  geom_point()


# Specify the ggplotly() function, and pass the plot.
ggplotly(plot) 

# Create a grouped boxplot:
# Specify the ggplot function.
boxplot <- ggplot(wages, aes(x=education, y=wage)) +
  geom_boxplot(fill='red', notch=TRUE, outlier.color='red') +
  labs(title="Wages by education level") +  
  theme_minimal()  

# Specify the ggplotly() function and pass the plot.
ggplotly(boxplot) 


# Create a scatterplot:
# Specify the ggplot function.
scatterplot <- ggplot(wages, mapping=aes(x=age, y=wage,
                                         colour=education,
                                         shape=job_class)) +
  geom_point(alpha=1, size=1) +  
  scale_x_continuous(breaks=seq(0, 90, 5), "Age of the Individual") +
  scale_y_continuous(breaks=seq(0, 350, 50), "Wage in $1000s") +
  scale_fill_brewer('set2')

# Specify the ggplotly() function, and pass the plot.
ggplotly(scatterplot)



# Create a histogram:
# Specify the ggplot function.
histogram <- ggplot(wages, aes(x=age)) +
  geom_histogram(fill= 'blue', color='red', stat='count') + 
  labs(x="Number of individuals",
       y="Age in years",
       title="Individuals by age group")

# Specify the ggplotly() function, and pass the plot.
ggplotly(histogram)





###############################################################################

# 5. Save your R script.


###############################################################################
  