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
png(filename = 'plot2.png')

# Create plot
plot(data$Time,
     data$Global_active_power,
     ylab = 'Global Active Power (kilowatts)',
     xlab = '',
     type = 'l')

# Close device
dev.off()
