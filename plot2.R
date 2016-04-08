setwd("~/Desktop/Desktop/Coursera/Rstudio/course4w1")

table <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
table$Date <- as.Date(table$Date, format = "%d/%m/%Y")

table <- table[(table$Date == "2007-02-01") | (table$Date == "2007-02-02"),]

table$Global_active_power <- as.numeric(table$Global_active_power)

table$DateTime <- as.POSIXct(paste(table$Date, table$Time))
plot(table$Global_active_power~table$DateTime, type="l", ylab = "Global Active Power(Kilowatts", xlab="")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
