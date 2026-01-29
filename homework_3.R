# Question 5.1
library(outliers)

crime_data <- read.table(
  "uscrime.txt", 
  header = TRUE
)

# inspecting the data
str(crime_data)
View(crime_data)

# creating box plot to see potential outliers

box_plot <- boxplot(crime_data$Crime, main = "Crime Rate per 100,000 people")
box_plot$out

# checking to see if data is normally distributed for Grubbs testing

hist(crime_data$Crime)
shapiro.test(crime_data$Crime)

# grubs test untransformed data
grubbs.test(crime_data$Crime)

# transforming the data and checking for normality again
crime_log <- log(crime_data$Crime)
shapiro.test(crime_log)

# we proceed with Grubbs test on transformed data
grubbs.test(crime_log, type = 10, opposite = TRUE)
outlier = exp(7.59739632021279)






