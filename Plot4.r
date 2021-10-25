#Reading table

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")

#Subseting

subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(subsetdata$Global_active_power)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)
timeline <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

par(mfrow = c(2, 2))

##Plot 1
plot(timeline,globalActivePower, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")
##Plot 2
plot(timeline,voltage, type = "l",xlab = "datetime", ylab = "Voltage")
##Plot 3
plot(timeline,subMetering1, type = "l", ylab = "Energy sub metering",xlab = "")
lines(timeline,subMetering2, type = "l", col="red")
lines(timeline,subMetering3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, bty = "n", col=c("black", "red", "blue"))
##Plot 4
plot(timeline, globalReactivePower,xlab = "", ylab = "Global_reactive_power", type = "l")

#exporting to png
dev.copy(png, file = "plot4.png",width= 480, height=480)

dev.off()
