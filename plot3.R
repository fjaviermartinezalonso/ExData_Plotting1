
## plot3.R
## Generate a line plot for each energy sub metering between 1st 
## and 2nd february, 2007

library(dplyr)
library(data.table)
library(lubridate)

# Read data records from 2007-02-01 to 2007-02-02
file_path <- "D:/datasets/household_power_consumption.txt"
df <- fread(file = file_path, sep = ";", na.strings = "?", nThread = 6)
df <- filter(df, grepl("^1/2/2007|^2/2/2007", Date))

# Get formatted dates from Date and Time columns
dates <- dmy_hms(paste(df$Date, df$Time))

# Generate Plot 3 in screen device and copy it into plot3.png
png(filename = "plot3.png", width = 480, height = 480, units = "px")
par(mfrow = c(1,1), mar = c(4,4,2,2))
with(df, plot(dates, Sub_metering_1, type = "n", xlab = "", 
              ylab = "Energy sub metering"))
points(dates, df$Sub_metering_1, type = "l", col = "black")
points(dates, df$Sub_metering_2, type = "l", col = "red")
points(dates, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
