#     PLOT 4
#     Author:  Michael Cooley
#     Date: 8-Jan-2015


#     Step 1:  upload the data.  Read in the data and save only the part needed.

#     Code assumes the text file is saved in the working direcotory

myData <- read.csv(
     file = "household_power_consumption.txt", 
     sep=";",
     stringsAsFactors=FALSE,
     na.strings = c("?", "")
     )

#     Data frame contains 2,075,259 obvs of 9 variables, but let's keep only 
#     data from the two date we need

myData <- myData[myData$Date == "1/2/2007"|myData$Date == "2/2/2007",]


#     Step 2:  create a "png" file of the panel of four charts

png("plot4.png ", width=480, height=480, units="px")

#     Establish the "table" for the four plots

par(mfrow=c(2,2))

#     First row, first column:

plot    (
    myData$Global_active_power, 
    type="l", 
    xlab="",
    ylab="Global Active Power (kilowats)",
    xaxt="n"
    )

axis    (
    1, 
    at=c(1, length(myData$Global_active_power)/2, length(myData$Global_active_power)), 
    labels=(c("Thu", "Fri", "Sat"))
    )

#     First row, second column
plot        (
    myData$Voltage, 
    type="l",     
    xlab="datetime",    
    ylab="Voltage",
    xaxt="n"
    )

axis    (
    1, 
    at=c(1, length(myData[,5])/2, length(myData[,5])), 
    labels=(c("Thu", "Fri", "Sat"))
    )

#     Second row, first column
plot    (
    myData[,7],
    type="l",
    xlab="",
    ylab="Energy sub metering",
    xaxt="n"
    )

lines(myData[,8], col="red")

lines(myData[,9], col="blue")

axis    (
    1, 
    at=c(1, length(myData[,7])/2, length(myData[,7])), 
    labels=(c("Thu", "Fri", "Sat"))
    )

legend    (
    "topright",
    names(myData)[7:9], 
    col=c("black", "red", "blue"), 
    lty=c(1,1,1))


#     Second row, second column
plot        (
    myData$Global_reactive_power, 
    type="l", 
    xlab="datetime",
    ylab="Global_reactive_power",
    xaxt="n"    
    )

axis    (    
    1, 
    at=c(1, length(myData[,4])/2, length(myData[,4])),
    labels=(c("Thu", "Fri", "Sat"))
    )
dev.off()