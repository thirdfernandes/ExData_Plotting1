setwd("~/Desktop/CourSera/Plotting")

t <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Formatting date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")
  
## Filtering data set for wanted dates
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
  
## Removing incomplete observations
t <- t[complete.cases(t),]

## Combining Date and Time columns
dateTime <- paste(t$Date, t$Time)
  
## Naming the vector
dateTime <- setNames(dateTime, "DateTime")
  
## Removing Date and Time column
t <- t[ ,!(names(t) %in% c("Date","Time"))]
  
## Adding DateTime column
t <- cbind(dateTime, t)
  
## Formating dateTime Column
t$dateTime <- as.POSIXct(dateTime)

 ## Creating Plot 2
 
  plot(t$Global_active_power~t$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
#Copying it down correctly

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
