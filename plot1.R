## Getting dataset with fread from data.table package
data <- fread("./Data/household_power_consumption.txt", na.strings = "?")

## Converting classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

## Subsetting the data
data <- data[Date == "2007/02/01" | Date == "2007/02/02" ]

## Plot
hist(data$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()



