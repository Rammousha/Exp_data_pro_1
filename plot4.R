


# Read the data
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, stringsAsFactors = FALSE)

# Consider subsetting the dataset to contain only data on the following dates:
subdata<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# Convert the Global_active_power column in subdata into numeric:
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# Combine the date and time into one variable so that we can generate our plot considering different times of the day.
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# Open a new png device and call it: plot4.png .. the plotted output will be saved in this file.
png("plot4.png", width = 480, height = 480)

# Plot 2 figures in each column
par(mfcol = c(2,2))

#1- first plot
plot(subdata$datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")


#2- second plot
plot(subdata$datetime, subdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subdata$datetime, subdata$Sub_metering_2, col="red")
lines(subdata$datetime, subdata$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"))

#3- third plot
plot(subdata$datetime, subdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#3- fourth plot
plot(subdata$datetime, subdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Close the device
dev.off()

