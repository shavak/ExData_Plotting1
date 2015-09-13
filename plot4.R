# plot4.R
# Exploratory Data Analysis
# Project 1
# Shavak Sinanan

# read data and quickly tidy it
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
epc <- subset(epc, (Date == "1/2/2007") | (Date == "2/2/2007"))
epc$Time <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# first plot
with(epc, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

# second plot
with(epc, plot(Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

# third plot
with(epc, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(epc, points(Time, Sub_metering_2, type = "l", col = "red"))
with(epc, points(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = c(1, 1, 1))

# fourth plot
with(epc, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()