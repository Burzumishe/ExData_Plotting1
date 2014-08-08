data <- read.table('household_power_consumption.txt',
                   header = TRUE,
                   sep = ';',
                   na.strings = '?',
                   colClasses = c(rep('character', 2), 
                                rep('numeric', 7)))

# Convert dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset data with date rangge
data <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

# Open png device
png(filename = 'plot1.png')

# Create plot
hist(data$Global_active_power,
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)',
     col = 'red')

# Close device
dev.off()

