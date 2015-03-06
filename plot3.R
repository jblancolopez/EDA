# S E T   W O R K I N G    D I R
setwd(".../4_Exploratory Data Analysis")

# R E A D   D A T A   S E T
power_consumption <- read.csv("./Project1/household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, dec=".")

# S U B S E T    D A T A   S E T
consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]

attach(consumption)
x <- paste(Date, Time)
consumption$DateTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
rownames(consumption) <- 1:nrow(consumption)
attach(consumption)

png("plot3.png", width = 480, height = 480, units = "px", bg = "transparent")
plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", 
     ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)
dev.off()
