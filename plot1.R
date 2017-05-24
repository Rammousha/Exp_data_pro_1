require(dplyr)

#Read the data
data <- read.table("household_power_consumption.txt",sep = ";", header = TRUE, stringsAsFactors = FALSE)


# Consider subsetting the dataset to contain only data on the following dates:
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert the Global_active_power column in subdata into numeric:
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# Open a new png device and call it: plot1.png .. the plotted output will be saved in this file.
png("plot1.png", width = 480, height = 480)


# The default hist() function will generate the histogram. We specify color, x-axis label and the title.
hist(subdata$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# close the device
dev.off()
