plot1 <- function() {
    house <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
    house$Date <- as.Date(house$Date, format = "%d/%m/%Y")
    house$datetime <- strptime(paste(house$Date, house$Time), format = "%d/%m/%Y %H:%M:%S")
    housing <- house[house$Date == as.Date("2007-02-01") | house$Date == as.Date("2007-02-02"), c("datetime", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]
    
    hist(housing$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
}
