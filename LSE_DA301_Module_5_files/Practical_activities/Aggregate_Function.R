# Import the built-in data set based on the CO2 uptake in grasses.
# Because it is a built-in data set, you don't have to import tidyverse.
data('CO2') 

# View the data set. Note the capital V.
View(CO2)

# Dimensions of the data set. 
dim(CO2) 

# Specify the function as aggregate(), the numeric variable (uptake),
# the grouping variable (conc), the data source (as C02),
# and the mean.
aggregate(uptake~conc, CO2, mean)


# Specify the function as aggregate(), the numeric variable (uptake),
# the grouping variable (conc), the additional grouping variable (treatment),
# the data source, and the mean.
aggregate(uptake~conc+Treatment, CO2, mean)


# Specify the function as aggregate(), the numeric variable (uptake),
# the grouping variable (conc), the additional grouping variable
# (type and treatment), the data source, and the mean.

aggregate(uptake~conc+Type+Treatment, CO2, mean)

# Compute the sum.
aggregate(uptake~conc, CO2, sum)

# Compute the standard deviation.
aggregate(uptake~conc, CO2, sd)


# Name and build the matrix:
sales <- matrix(c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 
                  10, 30, 40, 50, 70, 85, 95, 110, 120, 125,
                  15, 20, 25, 35, 45, 55, 65, 70, 85, 95,
                  12, 20, 28, 35, 49, 60, 71, 80, 95, 105,
                  9, 15, 26, 38, 45, 59, 75, 85, 99, 110),
                nrow=10, byrow=FALSE)

# Specify the row names:
rownames(sales) <- c('w1', 'w2', 'w3', 'w4', 'w5',
                     'w6', 'w7', 'w8', 'w9', 'w10')

# Specify the column names.
colnames(sales) <- c('t1', 't2', 't3', 't4', 't5') 

# Print the matrix.
sales 

# Verify the data structure.
class(sales)

# Maximum sales per week across 10 weeks:
# Specify data source, set the margin for rows,
# and add max function.

apply(sales, 1, max)

# Calculate mean per store:
# Specify data source, set the margin for columns,
# and add mean function.

apply(sales, 2, mean)

# Create/build a new data frame, and assign it to sales.
sales.df <- data.frame (t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                        t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                        t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                        t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                        t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# Print the data frame.
sales.df  

# Confirm creation of data frame.
class(sales.df)

# Find the mean sales per week:
# Specify the data source, set the margin for rows,
# and add mean function.

apply(sales.df, 1, mean)



# Find the min/max/mean sales per store:
# Specify the data source, set the margin for column,
# and add min/max/mean function.

apply(sales.df, 2, min)
apply(sales.df, 2, max)
apply(sales.df, 2, mean)

# Calculate mean sales for all stores except t2:
# Specify data source, specify excluded column,
# set the margin for columns, and add mean function.

apply(sales.df[,-2], 2, mean)

# Calculate mean sales for all stores except t2 and w10.

apply(sales.df[-10,-2], 2, mean)

# Assign NA to row and column in sales.df.
sales.df [1, 5] <- NA   

# Print the data frame.
sales.df

# Calculate the mean without the NA:
# Specify the data source, the margin for columns,
# the function (min), and indicate to ignore NA values.

apply(sales.df, 2, min, na.rm=TRUE)

# Assign a new list and insert values.
sales.number <- list(t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                     t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                     t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                     t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                     t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# View the new list.
sales.number 

# Confirm list creation.
class(sales.number) 

# Specify the data list and the function (mean), 
# and determine the object class.

lapply(sales.number, mean) 

# Assign a new data frame to the object, and create a data frame:
computers.df <- data.frame(t1 = c(10, 20, 30, 40, 50, 60, 70, 80, 90, 100),
                           t2 = c(10, 30, 40, 50, 70, 85, 95, 110, 120, 125),
                           t3 = c(15, 20, 25, 35, 45, 55, 65, 70, 85, 95),
                           t4 = c(12, 20, 28, 35, 49, 60, 71, 80, 95, 105),
                           t5 = c(9, 15, 26, 38, 45, 59, 75, 85, 99, 110))

# Print the new data frame. 
computers.df 

# Check data frame.
class(computers.df) 

# Calculate the sd for each store (object as data frame, function as sd).

lapply(computers.df, sd)

# Calculate the mean for each store (object as list, function as mean).
sales.number

sapply(sales.number, mean) 

# Calculate the sd for each store (object as data frame, function as sd).

sapply(computers.df, sd) 

# We need to import tidyverse of dplyr for the group_by function.
library(dplyr)

# Import built-in data set based on the CO2 uptake in grasses.
data('CO2')

# Dimensions of the data set
dim(CO2)

# Summarise the data frame.
# Group by the whole data frame.
group_by(CO2) %>% summarise(mean_concentration=mean(conc),
                            mean_uptake=mean(uptake))

# Include the different plant types and treatments.
# Specify the column names for grouping the data.
# The order of the column names is extremely important.
df_CO2 <- CO2 %>% group_by(Plant, Type, Treatment) %>%
  summarise(mean_concentration=mean(conc),
            mean_uptake=mean(uptake),
            .groups='drop')

# View the results.
df_CO2

# What about standard deviation, variance, mean, max, and min?
# Let's exclude the Type column.
# Include the different plant types and treatments.
df_CO2 <- CO2 %>% group_by(Plant, Treatment) %>%
  summarise(sd_concentration=sd(conc),
            sd_uptake=sd(uptake),
            var_concentration=var(conc),
            var_uptake=var(uptake),
            mean_concentration=mean(conc),
            mean_uptake=mean(uptake),
            min_concentration=min(conc),
            min_uptake=min(uptake),
            max_concentration=max(conc),
            max_uptake=max(uptake),
            .groups='drop')

# View the results.
df_CO2