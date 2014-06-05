## Read Table
hpc  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Subset Relevant Dates
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## Create PNG File
png(file = "plot1.png")

## Plot
hist(hpc$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Close PNG File
dev.off()