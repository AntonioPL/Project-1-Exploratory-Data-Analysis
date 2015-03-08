# Set WD to file location:
setwd("D:/MOOCs/Coursera/2015 03 - 2015 03 Exploratory Data Analysis/Project 1")
# Read Data
Data=read.csv(file = "household_power_consumption.txt", sep=";")
head(Data)
#Subset Data
Data=subset(Data, (Data$Date == "1/2/2007" | Data$Date== "2/2/2007")) 
#Formating
Data$Date=as.Date(Data$Date, format = "%d/%m/%Y")
Data$Global_active_power=as.numeric(levels(Data$Global_active_power)[Data$Global_active_power])
Data$NewDate <- as.POSIXct(paste(Data$Date, Data$Time))
Data$Sub_metering_1=as.numeric(levels(Data$Sub_metering_1)[Data$Sub_metering_1])
Data$Sub_metering_2=as.numeric(levels(Data$Sub_metering_2)[Data$Sub_metering_2])
Data$Sub_metering_3=as.numeric(levels(Data$Sub_metering_3)[Data$Sub_metering_3])
Data$Voltage=as.numeric(levels(Data$Voltage)[Data$Voltage])
Data$Global_reactive_power=as.numeric(levels(Data$Global_reactive_power)[Data$Global_reactive_power])

#Plot4:
png("plot4.png")
par(mfcol=c(2,2))
plot(Data$NewDate, Data$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(Data$NewDate, Data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(Data$NewDate, Data$Sub_metering_2, type="l", col="red")
lines(Data$NewDate, Data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
plot(Data$NewDate,Data$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(Data$NewDate,Data$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()