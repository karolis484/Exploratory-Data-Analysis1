#Reading table
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings="?")

#Subseting
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
globalActivePower <- as.numeric(subsetdata$Global_active_power)

#histogram
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequancy")

#exporting to png
dev.copy(png, file = "plot1.png",width= 480, height=480)

dev.off()
