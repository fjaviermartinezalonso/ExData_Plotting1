
## plot1.R
## Generate a histogram for global active power between 1st and 2nd 
## february, 2007

library(dplyr)
library(data.table)

# Read data records from 2007-02-01 to 2007-02-02
file_path <- "D:/datasets/household_power_consumption.txt"
df <- fread(file = file_path, sep = ";", na.strings = "?", nThread = 6)
df <- filter(df, grepl("^1/2/2007|^2/2/2007", Date))

# Generate Plot 1 in screen device and copy it into plot1.png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
par(mfrow = c(1,1), mar = c(4,4,2,2))
hist(df$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
