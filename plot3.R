## This code reads data from the "household_power_consumption.txt" file,
## selects several fields of data for 2007-02-01 and 2007-02-02 and 
## displays them i a multicolor line chart

# Read data table
inp_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings="?")

# Format date field as Posixlt
inp_data$Date <- strptime(inp_data$Date, format="%d/%m/%Y")

# Extract records for 2007-02-01 and 2007-02-02 and drop remainder
plot_data <- inp_data[inp_data$Date=="2007-02-01" | inp_data$Date=="2007-02-02",]
rm(inp_data)

# Combine Date and Time into a single field
plot_data$NewDate <- as.POSIXlt(with(plot_data, paste(Date, Time)), 
                                format="%Y-%m-%d %H:%M:%S")
# Initialise PNG device
png("plot3.png", width=480, height=480, units="px")
dev.set(3)
par(col="black")

# Plot first set of data
plot(plot_data$NewDate, plot_data$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")

# Plot second set of data
par(new=T)
par(col="red")
lines(plot_data$NewDate, plot_data$Sub_metering_2)

# Plot third set of data
par(new=T)
par(col="blue")
lines(plot_data$NewDate, plot_data$Sub_metering_3)

# Draw legend
legend(x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = c(1,1), text.col = "black")

# Close PNG device
dev.off(3)