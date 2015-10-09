## COURSERA: EXPLORATORY DATA ANALYSIS
## COURSE PROJECT 1
## This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. 
## In particular, we will be using the "Individual household electric power consumption Data Set".

## PLOT 1 - HISTOGRAM

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
dataset$Date<-format(as.Date(dataset$Date,"%d/%m/%Y"))
datasubset <- dataset[dataset$Date >= "2007-02-01" & dataset$Date <= "2007-02-02", ]

# Creates histogram
hist(datasubset$Global_active_power, main="Global Active Power", col="Red", xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png", width = 480, height = 480)
dev.off()
