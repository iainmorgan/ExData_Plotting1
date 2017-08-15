## This code reads data from the "household_power_consumption.txt" file,
## selects the "Global specific power" data for 2007-02-01 and 2007-02-02 and 
## displays it in a histogram

# Read data table
inp_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")

# Format date field as Posixlt
inp_data$Date <- strptime(inp_data$Date, format="%d/%m/%Y")

# Extract records for 2007-02-01 and 2007-02-02 and drop remainder
plot_data <- inp_data[inp_data$Date=="2007-02-01" | inp_data$Date=="2007-02-02",]
rm(inp_data)

# Initialise PNG device
png("plot1.png", width=480, height=480, units="px")
dev.set(3)

# Plot histogram
hist(plot_data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="red")

# Close PNG device
dev.off(3)


