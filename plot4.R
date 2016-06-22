dt <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?", 
                 stringsAsFactors = FALSE, header = TRUE)
subset <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"), ]
Datetime <- parse(as.Date(subset$Date, format("%d/%m/%Y")),subset$Time)
subset$Datetime <- as.POSIXct(Datetime)

par(mfrow = c(2,2))
plot(subset$Datetime, subset$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab = "")

plot(subset$Datetime, subset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(subset$Datetime, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset$Datetime, subset$Sub_metering_2, col = "red")
lines(subset$Datetime, subset$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subset$Datetime, subset$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", height = 680, width = 680)
dev.off()
