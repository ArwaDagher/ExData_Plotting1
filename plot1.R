setwd("~/Desktop/Desktop/Coursera/Rstudio/course4w1")

table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
table$Date <- as.Date(table$Date, format = "%d/%m/%Y")
table$Time <- strptime(table$Time, format = "%H:%M:%S")

table <- table[(table$Date == "2007-02-01") | (table$Date == "2007-02-02"),]

table$Global_active_power <- as.numeric(table$Global_active_power)

hist(table$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power(Kilowatts)", ylab = "Frequency")

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
