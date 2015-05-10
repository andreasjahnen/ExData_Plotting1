###################################################
## Course project 1 - plot4.R
##########
##
## This script loads the household power consompution and creates 4 plots of   
## different variables for the days 2007-02-01 and 2007-02-02.
## 
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
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))

# subset to only 2007-02-01 and 2007-02-02:
d <- data[data$datetime >= as.POSIXlt("2007-02-01") & data$datetime < as.POSIXlt("2007-02-03"), ]

# create now the required plot:
# Note: plot created on a German system, therefore weekdays are in German in the export!
png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2)) # 2 by 2 plots

# left top
plot(d$datetime, d$Global_active_power, xlab = "",ylab = "Global Active Power (kilowatts)", type = "l")

# right top
plot(d$datetime, d$Voltage, xlab = "datetime",ylab = "Voltage", type = "l")

# left bottom:
plot(d$datetime, d$Sub_metering_1, xlab = "",ylab = "Energy sub metering", type = "l")
lines(d$datetime, d$Sub_metering_2, col = "red", type = "l")
lines(d$datetime, d$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lw=c(2, 2, 2), col=c("black", "red","blue"), pt.cex = 0.4, cex = 0.9)

# right bottom:
plot(d$datetime, d$Global_reactive_power, xlab = "datetime",ylab = "Global_reactive_power", type = "l")

dev.off()
