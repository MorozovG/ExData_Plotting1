## Getting dataset with fread from data.table package
data <- fread("./Data/household_power_consumption.txt", na.strings = "?")

## Converting classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)

## Subsetting the data
data <- data[Date == "2007/02/01" | Date == "2007/02/02" ]

## Adding and converting new variables
data[,DateTime:=as.POSIXct(paste(data$Date, data$Time))]

## Plot
plot(data$DateTime, data$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

