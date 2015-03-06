## Getting dataset with fread from data.table package
data <- fread("./Data/household_power_consumption.txt", na.strings = "?")

## Converting classes
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

## Subsetting the data
data <- data[Date == "2007/02/01" | Date == "2007/02/02" ]

## Adding and converting new variables
data[,DateTime:=as.POSIXct(paste(data$Date, data$Time))]

## Open graphics device
png(filename="plot3.png",width=480,height=480)

## Plot
attach(data)
plot(Sub_metering_1~DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2~DateTime, col = "red")
lines(Sub_metering_3~DateTime, col = "blue")

## Adding legend
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Close graphics device
dev.off()