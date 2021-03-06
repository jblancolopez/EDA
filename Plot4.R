# S E T   W O R K I N G    D I R
setwd("C:/Users/j.blancolopez/Desktop/CORSI/Coursera/Data Science especialization/4_Exploratory Data Analysis/Project1")
# R E A D   D A T A   S E T
power_consumption <- read.csv("./household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, dec=".")
# S U B S E T    D A T A   S E T
consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

x <- paste(consumption$Date, consumption$Time)
consumption$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
attach(consumption)
###################################
#  P L O T    4
##################################
png("plot4.png",width = 480, height = 480,units = "px", bg = "transparent")
par(mfrow = c(2, 2))
## Top-left
plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
## Top-right
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
## Bottom-left
plot(DateTime, Sub_metering_1, type = "l", col = "black",
     xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
# Remove the border of legend here.
legend("topright", bty = "n", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)
## Bottom-right
plot(DateTime, Global_reactive_power, type = "l", col = "black", 
     xlab = "datetime", ylab = colnames(consumption)[4])
dev.off()
