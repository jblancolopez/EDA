# S E T   W O R K I N G    D I R
setwd("C:/Users/j.blancolopez/Desktop/CORSI/Coursera/Data Science especialization/4_Exploratory Data Analysis/Project1")
# R E A D   D A T A   S E T
power_consumption <- read.csv("./household_power_consumption.txt", header=T, sep=";", stringsAsFactors=F, dec=".")
# S U B S E T    D A T A   S E T
consumption <- power_consumption[power_consumption$Date %in% c("1/2/2007","2/2/2007") ,]
#GAP as.numeric for hist()
consumption$GAP<-as.numeric(consumption$Global_active_power)
###################################
#  P L O T    1
##################################
png("plot1.png", width=480, height=480)
hist(consumption$GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
