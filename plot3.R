
# read the file
house_names <- c("Date", "Time", "Global_active_power", 
	"Global_reactive_power", "Voltage", "Global_intensity", 
	"Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

house <- read.table("household_power_consumption.txt", header = FALSE, 
	sep = ";", stringsAsFactors = FALSE, na.strings = "?", skip = 66637, 
	nrows = 2880, col.names = house_names)


# create datetime values as opposed to strings that represent dates
house$datetime <- paste(house[[1]], house[[2]])
house$datetime <- strptime(house$datetime, format = "%d/%m/%Y %H:%M:%S")


# open a png device of 480x480 px
png(filename = "plot3.png", width = 480, height = 480, units = "px")


# plot the data
plot(house$datetime, house$Sub_metering_1, ylab="Energy sub metering", xlab =
"", type = "l")
lines(house$datetime, house$Sub_metering_2, col="red")
lines(house$datetime, house$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	col = c("black", "red", "blue"), lty = c(1,1))


# close the device
dev.off()
