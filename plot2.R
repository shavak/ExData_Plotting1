# plot2.R
# Exploratory Data Analysis
# Project 1
# Shavak Sinanan

# read data and quickly tidy it
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
epc <- subset(epc, (Date == "1/2/2007") | (Date == "2/2/2007"))
epc$Time <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

png(filename = "plot2.png", width = 480, height = 480)
with(epc, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()