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

# Plot2:
png("plot2.png")
plot(Data$NewDate, Data$Global_active_power, type="l", ylab= "Global Active Power (kilowatts)", xlab="")
dev.off()