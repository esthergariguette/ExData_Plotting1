# Read the data
fulltable <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Extract data from 2007-02-01 and 2007-02-02 
mydata <- fulltable[fulltable$Date %in% c("1/2/2007","2/2/2007"),]

# Convert Date and Time variables
mydata$Date <- as.Date(mydata$Date , "%d/%m/%Y")
mydata$Time <- paste(mydata$Date, mydata$Time, sep=" ")
mydata$Time <- strptime(mydata$Time, "%Y-%m-%d %H:%M:%S")

# Save plot as PNG file
png(file="plot3.png", width = 480, height =480)

# Make the plot
plot(mydata$Time, mydata$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(mydata$Time, mydata$Sub_metering_2, type = "l", col = "red")
lines(mydata$Time, mydata$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# Close graphics device
dev.off()