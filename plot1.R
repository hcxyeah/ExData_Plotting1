setwd("/Users/Caixia/Downloads/Coursera/Data_Science/Exploratory_Data_Analysis")
dt <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, 
                 na.strings = "?", stringsAsFactors = FALSE)

subset <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]
Datetime <- paste(as.Date(subset$Date, format("%d/%m/%Y")), subset$Time)
subset$Datetime <- as.POSIXct(Datetime)

hist(subset$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)")
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
