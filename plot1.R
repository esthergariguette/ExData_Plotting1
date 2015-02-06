# Read the data
fulltable <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# Extract data from 2007-02-01 and 2007-02-02 
mydata <- fulltable[fulltable$Date %in% c("1/2/2007","2/2/2007"),]

# Convert Date and Time variables
mydata$Date <- as.Date(mydata$Date , "%d/%m/%Y")
mydata$Time <- paste(mydata$Date, mydata$Time, sep=" ")
mydata$Time <- strptime(mydata$Time, "%Y-%m-%d %H:%M:%S")

# Save plot as PNG file
png(file="plot1.png", width = 480, height =480)

# Make the plot
hist(mydata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close graphics device
dev.off()
