# Determine your working directory
getwd()

# Change your current directory.
setwd(dir='/Users/codyshan/Desktop/Data Science LSE/Course 3 new/LSE_DA301_Module_6_files/Data') 

# Install the factoextra package for k-means clustering. 
install.packages('factoextra')

# Import the necessary libraries.
# Visualisation and data wrangling.
library(tidyverse)
# For k-means clustering and visualisation
library(factoextra) 

# Import the CSV file (fruit.csv).
fruit <- read.csv(file.choose(), header=TRUE)

# View the top six rows.
head(fruit)

# View summary statistics.
summary(fruit)

# Create a scatterplot to view the data set.
# Specify x as sepal_length, y as sepal_width, and color as fruit_type.
ggplot(fruit, aes(x=sepal_length,
                  y=sepal_width,
                  color=fruit_type)) +
  geom_point()

# Assign labels to the fruit_type column.
fruit.labels <- fruit$fruit_type

# View the table and distribution of labels.
table(fruit.labels)

# Drop columns we will not use.
# For example, X, tree_age, location, colour_blossom, and fruit_type.
df_fruit <- dplyr::select(fruit, -c(1, 4:7))

# View the output.
names(df_fruit)

# Determine whether there are any missing values.
colSums(is.na(df_fruit))

# View the result.
head(df_fruit)

# Scale the data set.
df_fruit_scale <- scale(df_fruit)

# View the result.
head(df_fruit_scale)
df_fruit_scale

# Use the dist() function to calculate distance metrics between observations.
fruit_data <- dist(df_fruit_scale)

# View the result.
fruit_data[1:6]

# Select the optimal number of clusters (k).
fviz_nbclust(df_fruit_scale, kmeans, method='wss') +
  labs(subtitle="Elbow method")


# Create the k-means model with the kmeans() function.
model <- kmeans(df_fruit_scale, centers=3, nstart=100)

# View the output.
print(model)

# Add labels as row names.
rownames(df_fruit_scale) <- paste(fruit$fruit_type,
                                  # Add number to all the rows (dim()),
                                  # starting with 1.
                                  1:dim(fruit)[1],
                                  # Separate the name and number with an underscore.
                                  sep="_")

# View the output.
head(df_fruit_scale)

# Visualise the clusters.
fviz_cluster(model, data=df_fruit_scale)

# Interpret mislabelling.
table(model$cluster, fruit$fruit_type)

