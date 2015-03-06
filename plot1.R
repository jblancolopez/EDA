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
dim(consumption) # 2880 10
attach(consumption)


###################################
#  P L O T    1
##################################

#globalActivePower <- as.numeric(consumption$Global_active_power)
png("plot1.png", width=480, height=480)
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
