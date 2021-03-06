###################################################
## Course project 1 - plot1.R
##########
##
## This script loads the household power consompution and creates a histogram 
## of the Global Active Power (in kilowatts) for the days 2007-02-01 and 
## 2007-02-02.
####################################################

# set working directory:
setwd("/home/jahnen/Dropbox/Learning/Data Science Degree/4 - Exploratory Data Analysis/week1/Project 1/")

# load the data:
data <- read.csv("household_power_consumption.txt", sep = ";")

# convert raw data to useful types in R:
# create a datetime column:
data$datetime <- paste(data$Date, data$Time, sep = " ")
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")
# as numeric:
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

# subset to only 2007-02-01 and 2007-02-02:
d <- data[data$datetime >= as.POSIXlt("2007-02-01") & data$datetime < as.POSIXlt("2007-02-03"), ]

png("plot1.png", width = 480, height = 480)
hist(d$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()

