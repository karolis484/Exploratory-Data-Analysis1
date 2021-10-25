#Reading table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")

#Subseting
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

timeline <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

#plot
plot(timeline,subMetering1, type = "l", ylab = "Energy sub metering",xlab = "")
lines(timeline,subMetering2, type = "l", col="red")
lines(timeline,subMetering3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#exporting to png
dev.copy(png, file = "plot3.png",width= 480, height=480)

dev.off()
