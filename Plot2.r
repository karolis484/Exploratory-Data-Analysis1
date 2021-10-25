#Reading table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")

#Subseting
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(subsetdata$Global_active_power) #subseting
timeline <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#plot
plot(timeline,globalActivePower, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")

#exporting to png
dev.copy(png, file = "plot2.png",width= 480, height=480)

dev.off()
