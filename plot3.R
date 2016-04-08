setwd("~/Desktop/Desktop/Coursera/Rstudio/course4w1")

table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
table$Date <- as.Date(table$Date, format = "%d/%m/%Y")

table <- table[(table$Date == "2007-02-01") | (table$Date == "2007-02-02"),]



table$DateTime <- as.POSIXct(paste(table$Date, table$Time))

png("plot3.png", width=480, height=480)

plot(table$Sub_metering_1~table$DateTime, type="l", col="black", xlab="", ylab = "Energy Sub metering")
lines(table$DateTime, table$Sub_metering_2, col="red")
lines(table$DateTime, table$Sub_metering_3, col="blue")

legend("topright",  col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

dev.off()
