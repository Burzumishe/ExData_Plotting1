data <- read.table('household_power_consumption.txt',
                   header = TRUE,
                   sep = ';',
                   na.strings = '?',
                   colClasses = c(rep('character', 2), 
                                rep('numeric', 7)))

# Convert and combine time
data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Convert dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data with date range
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

# Open png device
png(filename = 'plot3.png')

# Create plot
plot(data$Time,
     data$Sub_metering_1,
     type = 'l',
     xlab = '',
     ylab = 'Energy sub metering')
lines(data$Time,
      data$Sub_metering_2,
      col = 'red')
lines(data$Time,
      data$Sub_metering_3,
      col = 'blue')
legend('topright', 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'), 
       lty = 'solid')
       type = 'l')

# Close device
dev.off()
