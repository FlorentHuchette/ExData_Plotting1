#Load Data
library(readr)
house_power_consumption<- read_delim("~/RStudio/Projet 1/household_power_consumption.txt",delim=';')

#Restricting data to date 01/02/2007 and 02/02/2007
hpc <- subset(house_power_consumption, (Date == "1/2/2007") | (Date =="2/2/2007"))

#Plot 1
png(file = "plot1.png",width=480,height=480)
hist(hpc$Global_active_power, col = "red", breaks = 12, main = "Global Active Power", xlab ="Global Active Power (kilowatts)")
dev.off()