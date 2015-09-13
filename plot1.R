# plot1.R
# Exploratory Data Analysis
# Project 1
# Shavak Sinanan

# read data and quickly tidy it
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c(rep("character", 2), rep("numeric", 7)))
epc <- subset(epc, (Date == "1/2/2007") | (Date == "2/2/2007"))
epc$Time <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")

png(filename = "plot1.png", width = 480, height = 480)
hist(epc$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()