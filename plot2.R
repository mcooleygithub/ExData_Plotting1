#     PLOT 2
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


#     Step 2:  create a "png" file of the line chart

png("plot2.png ", width=480, height=480, units="px")

plot(
    myData$Global_active_power, 
    type="l", 
    xlab="",
    ylab="Global Active Power (kilowats)",
    xaxt="n"
    )

axis(
    1, 
    at=c(1, length(myData$Global_active_power)/2, length(myData$Global_active_power)), 
    labels=(c("Thu", "Fri", "Sat"))
    )
dev.off()