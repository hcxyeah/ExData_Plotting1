dt <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                 na.strings = "?", stringsAsFactors = FALSE)

subset <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]
Datetime <- paste(as.Date(subset$Date, format("%d/%m/%Y")), subset$Time)
subset$Datetime <- as.POSIXct(Datetime)

plot(subset$Datetime, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset$Datetime, subset$Sub_metering_2, col = "red")
lines(subset$Datetime, subset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
