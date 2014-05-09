data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data <- subset(data, data$Date == '2007-02-01' | data$Date == '2007-02-02')

#http://stackoverflow.com/questions/11609252/r-tick-data-merging-date-and-time-into-a-single-object
data$Date <- as.POSIXct(paste(data$Date, data$Time), format = '%Y-%m-%d %H:%M:%S')

#tells R to create a 2x2 canvas for 4 plots and fill them by columns, if you want to use rows, use par(mfrow = c(x, x))
par(mfcol = c(2, 2))

plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

plot(data$Date, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
legend("topright", legend = names(data[7:9]), lty = 1, col = c("black", "red", "blue"), cex = .9, bty = "n")
lines(data$Date,  data$Sub_metering_2, col = "red")
lines(data$Date,  data$Sub_metering_3, col = "blue")


plot(data$Date, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(data$Date, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
