## Plot 2
## subset from 2007-02-01 and 2007-02-02
## plot of global active power vs. time


plot2 <- function(){
        
        library(ggplot2)
        
        ## file in working directory
        
        full_data <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";")
        
        ## Creating new column merging date and time
        
        datetime <- strptime(paste(full_data$Date, full_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        full_data <- cbind(full_data, datetime)
        
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
        
        png("plot2.png", width=500, height=500)
        with(subsetdata, plot(datetime, Global_active_power, type="l", xlab="Day", ylab="Global Active Power (kilowatts)"))        
        dev.off()
}