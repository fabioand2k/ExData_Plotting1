full_dataset <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")

## Subset the data
subset_data <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_dataset)

## Date Convert
datetime <- paste(as.Date(subset_data$Date), subset_data$Time)
subset_data$Datetime <- as.POSIXct(datetime)

## Plot 1
hist(subset_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
