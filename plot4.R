## COURSERA: EXPLORATORY DATA ANALYSIS
## COURSE PROJECT 1
## This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. 
## In particular, we will be using the "Individual household electric power consumption Data Set".

## PLOT 4 - MULTIPLE CHARTS

# Checks/creates folder
mainDir<- "C:/Coursera/Assignments/Exploratory"
dir.create(mainDir, showWarnings = FALSE)
setwd(mainDir)

# Downloads/unzipps source file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
unzip(temp, overwrite = TRUE, exdir= mainDir)
unlink(temp)

# Reads/subsets data. Only 2007-02-01 and 2007-02-02.
filename<- "household_power_consumption.txt"
dataset<-read.table(filename, check.names = FALSE, sep=";", header=TRUE, colClasses=c(rep("character",2),rep("numeric",7)), na.strings="?")
datasubset <- dataset[as.Date(dataset$Date, "%d/%m/%Y") >= "2007-02-01" & as.Date(dataset$Date, "%d/%m/%Y") <= "2007-02-02", ]
library(lubridate)
datasubset$DTF<-dmy_hms(paste(datasubset$Date, datasubset$Time))

# Creates graphs
par(mfcol=c(2,2))
plot( datasubset$DTF,datasubset$Global_active_power, type="l", ylab="Global active power (kilowatts)", xlab="")

plot(datasubset$DTF, datasubset$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab="")
lines(datasubset$DTF, datasubset$Sub_metering_2, col="red")
lines(datasubset$DTF, datasubset$Sub_metering_3, col="blue")
legend("topright", pch=("_"), col= c("black","blue","red"), legend=colnames(datasubset[7:9]), cex=0.7)

plot( datasubset$DTF,datasubset$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot( datasubset$DTF,datasubset$Global_reactive_power, type="l", ylab= "Global_reactive_power", xlab="datetime")
dev.copy(png,"plot4.png", width = 480, height = 480)
dev.off()
