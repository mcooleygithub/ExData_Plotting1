#     PLOT 1
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


#     Step 2:  create a "png" file of the histogram

png("plot1.png ", width=480, height=480, units="px")

hist(myData$Global_active_power, 
     col='red', 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
          )

dev.off() 
