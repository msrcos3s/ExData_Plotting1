## Plot 1
## subset from 2007-02-01 and 2007-02-02
## histogram of global active power

plot1 <- function(){
        
library(ggplot2)
        
## file in working directory
        
full_data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")

## changing class of variables 

full_data$Date <- as.Date(full_data$Date, format="%d/%m/%Y")
full_data$Time <- format(full_data$Time, format="%H:%M:%S")
full_data$Global_active_power <- as.numeric(full_data$Global_active_power)
full_data$Global_reactive_power <- as.numeric(full_data$Global_reactive_power)
full_data$Voltage <- as.numeric(full_data$Voltage)
full_data$Global_intensity <- as.numeric(full_data$Global_intensity)
full_data$Sub_metering_1 <- as.numeric(full_data$Sub_metering_1)
full_data$Sub_metering_2 <- as.numeric(full_data$Sub_metering_2)
full_data$Sub_metering_3 <- as.numeric(full_data$Sub_metering_3)


## subsetting

subsetdata <- subset(full_data, Date == "2007-02-01" | Date =="2007-02-02")

## plotting

png("plot1.png", width=500, height=500)
hist(subsetdata$Global_active_power, col="red", border="black", main ="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
}