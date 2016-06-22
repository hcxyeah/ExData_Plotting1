dt <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                 na.strings = "?", stringsAsFactors = FALSE)

subset <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]
Datetime <- paste(as.Date(subset$Date, format("%d/%m/%Y")), subset$Time)
subset$Datetime <- as.POSIXct(Datetime)

str(subset)
subset$wday <- weekdays(subset$Date)
plot(subset$Datetime, subset$Global_active_power, type = "l", 
     ylab = "Global Active Power(kilowatts)", xlab = "")
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
