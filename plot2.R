data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#converts to date string
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')

#subsets the two days for analysis
data <- subset(data, data$Date == '2007-02-01' | data$Date == '2007-02-02')

#http://stackoverflow.com/questions/11609252/r-tick-data-merging-date-and-time-into-a-single-object
data$Date <- as.POSIXct(paste(data$Date, data$Time), format = '%Y-%m-%d %H:%M:%S')


plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")