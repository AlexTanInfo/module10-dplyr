#Use "dplyr" 
#Install.packages("dplyr")
library(dplyr)

#Load in SwissData from data set from data folder and view it to understand what is in it. 
swiss.data <- read.csv("data/SwissData.csv", stringsAsFactors = FALSE)
View(swiss.data)

#Add a column (using dpylr) that is the absolute difference between Education and Examination and call it 
# Educated.Score
swiss.data <- mutate(swiss.data, Educated.Score = abs(Education - Examination))

#Which area(s) had the largest difference 
largest.diff <- filter(swiss.data, Educated.Score == max(Educated.Score))
largest.diff <- select(largest.diff, Region)

#Find which region has the highest percent of men in agriculture and return only the 
#percent and region name.  Use pipe operators to accomplish this. 
agriculture.percent <- filter(swiss.data, Agriculture == max(Agriculture)) %>% select(Region, Agriculture)

#Find the average of all infant.mortality rates and create a column (Mortality.Difference)
# showing the difference between a regions mortality rate and the mean. Arrange the dataframe in 
# Descending order based on this new column. Use pipe operators.
mean <- sum(select(swiss.data, Infant.Mortality)) / nrow(swiss.data)
swiss.data <- mutate(swiss.data, Mortality.Difference = Infant.Mortality - mean)
swiss.data <- arrange(swiss.data, -Mortality.Difference)
View(swiss.data)

# Create a new data frame that only is that of regions that have a Infant mortality rate less than the 
# mean.  Have this data frame only have the regions name, education and mortality rate. 
filter.swiss.data <- select(filter(swiss.data, Mortality.Difference < 0), Region, Education, Infant.Mortality)
View(filter.swiss.data)

#Filter one of the columns based on a question that you may have (which regions have a higher
#education rate, etc.) and write that to a csv file
filter.swiss.data <- filter(filter.swiss.data, Education > 5)
write.csv(filter.swiss.data, file = "data/filter.swiss.data.csv")
  
# Create a function that can take in two different region names and compare them based on a statistic 
# Of your choice (education, Examination, ect.)  print out a statment describing which one is greater 
# and return a data frame that holds the selected region and the compared variable.  If your feeling adventurous
# also have your function write to a csv file.
which.is.greater <- function(region1, region2, statistic) {
  data <- filter(swiss.data, Region = region1)
}






