#Load Data
library(readr)
house_power_consumption<- read_delim("~/RStudio/Projet 1/household_power_consumption.txt",delim=';')

#Restricting data to date 01/02/2007 and 02/02/2007
hpc <- subset(house_power_consumption, (Date == "1/2/2007") | (Date =="2/2/2007"))

#Adding a datetime column to the dataset
hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot 2
png(file = "plot2.png",width=480,height=480)
plot(hpc$DateTime, hpc$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type = "l")
dev.off()