plot4 <- function() {
    par(mfrow = c(2, 2))
    
    house <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
    house$datetime <- strptime(paste(house$Date, house$Time), format = "%d/%m/%Y %H:%M:%S")
    house$Date <- as.Date(house$Date, format = "%d/%m/%Y")
    housing <- house[house$Date == as.Date("2007-02-01") | house$Date == as.Date("2007-02-02"), c("datetime", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
    
    plot(housing$datetime, housing$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
    
    plot(housing$datetime, housing$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
    
    plot(housing$datetime, housing$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(housing$datetime, housing$Sub_metering_1)
    lines(housing$datetime, housing$Sub_metering_2, col = "red")
    lines(housing$datetime, housing$Sub_metering_3, col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))
    
    plot(housing$datetime, housing$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
}
