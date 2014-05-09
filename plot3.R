data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data <- subset(data, data$Date == '2007-02-01' | data$Date == '2007-02-02')

#http://stackoverflow.com/questions/11609252/r-tick-data-merging-date-and-time-into-a-single-object
data$Date <- as.POSIXct(paste(data$Date, data$Time), format = '%Y-%m-%d %H:%M:%S')

plot(data$Date, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Date,  data$Sub_metering_2, col = "red")
lines(data$Date,  data$Sub_metering_3, col = "blue")
legend("topright", legend = names(data[7:9]), lty = 1, col = c("black", "red", "blue"), cex = .9)