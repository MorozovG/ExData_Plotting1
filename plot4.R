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
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2), mar=c(4,4,2,1))

## Plot
attach(data)
plot(Global_active_power~DateTime, type = "l", ylab = "Global Active Power", xlab = "")
plot(Voltage~DateTime, type = "l", ylab = "Voltage", xlab = "datetime")
plot(Sub_metering_1~DateTime, type="l", ylab = "Energy sub metering", xlab = "")
lines(Sub_metering_2~DateTime,col = "red")
lines(Sub_metering_3~DateTime,col = "blue")
legend("topright", col=c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power~DateTime, type="l", xlab = "datetime")

## Close graphics device
dev.off()