## Plot 4
## subset from 2007-02-01 and 2007-02-02
## 4 plots in 1 (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)


plot4 <- function(){
        
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
        
        png("plot4.png", width=500, height=500)
        par(mfrow=c(2,2))
        with(subsetdata, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
        with(subsetdata, plot(datetime, Voltage, type = "l", xlab="datetime", ylab="Voltage"))
        with(subsetdata, plot(datetime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
        lines(subsetdata$datetime, subsetdata$Sub_metering_2,type="l", col= "red")
        lines(subsetdata$datetime, subsetdata$Sub_metering_3,type="l", col= "blue")
        legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))
        with(subsetdata, plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))
        dev.off()
}