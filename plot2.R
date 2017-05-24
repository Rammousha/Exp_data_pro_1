
require(dplyr)

# Read the data
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Consider only the data on the following dates:
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# Convert the Global_active_power column in subdata into numeric:
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# Combine the date and time into one variable so that we can generate our plot considering different times of the day.
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# Open a new png device and call it: plot2.png .. the plotted output will be saved in this file.
png("plot2.png", width = 480, height = 480)


# Generate the plot
plot(subdata$datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (Kilowatts)")

#Close the device
dev.off()

