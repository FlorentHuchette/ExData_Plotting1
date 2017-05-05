#Load Data
library(readr)
house_power_consumption<- read_delim("~/RStudio/Projet 1/household_power_consumption.txt",delim=';')

#Restricting data to date 01/02/2007 and 02/02/2007
hpc <- subset(house_power_consumption, (Date == "1/2/2007") | (Date =="2/2/2007"))

#Adding a datetime column to the dataset
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot 4
png(file = "plot4.png",width=480,height=480)
par(mfrow= c(2,2))
#1.1
plot(hpc$DateTime, hpc$Global_active_power, xlab="", ylab="Global Active Power", type = "l")
#1.2
plot(hpc$DateTime,hpc$Voltage, type = "l", xlab = "datetime", ylab="Voltage" )
#2.1
plot(hpc$DateTime, hpc$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")
lines(hpc$DateTime, hpc$Sub_metering_2, type = "l", col= "red")
lines(hpc$DateTime, hpc$Sub_metering_3, type = "l", col= "blue")
legend(x="topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty= c(1,1,1), bty = "n")
#2,2
with(hpc, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()