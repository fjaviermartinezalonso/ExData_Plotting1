
## plot2.R
## Generate a line plot for global active power between 1st and 2nd 
## february, 2007

library(dplyr)
library(data.table)
library(lubridate)

# Read data records from 2007-02-01 to 2007-02-02
file_path <- "D:/datasets/household_power_consumption.txt"
df <- fread(file = file_path, sep = ";", na.strings = "?", nThread = 6)
df <- filter(df, grepl("^1/2/2007|^2/2/2007", Date))

# Get formatted dates from Date and Time columns
dates <- dmy_hms(paste(df$Date, df$Time))

# Generate Plot 2 in screen device and copy it into plot2.png
png(filename = "plot2.png", width = 480, height = 480, units = "px")
par(mfrow = c(1,1), mar = c(4,4,2,2))
with(df, plot(dates, Global_active_power, type = "l", xlab = "", 
              ylab = "Global Active Power (kilowatts)"))
dev.off()
