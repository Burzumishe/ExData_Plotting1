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
png(filename = 'plot4.png')

# Create plots
par(mfrow=c(2,2))

# Top left
plot(data$Time,
     data$Global_active_power,
     ylab = 'Global Active Power',
     xlab = '',
     type = 'l')

# Top right
plot(data$Time,
     data$Voltage,
     xlab = 'datetime',
     ylab = 'Voltage',
     type = 'l')

# Bottom left
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
       lty = 'solid',
       bty = 'n')

# Bottom right
plot(data$Time,
     data$Global_reactive_power,
     xlab = 'datetime',
     ylab = 'Global_reactive_power',
     type = 'l')

# Close device
dev.off()
