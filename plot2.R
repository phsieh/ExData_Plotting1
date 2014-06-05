## Read Table
hpc  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Create Subset For Graph
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## Create Columne With Time In Proper Format
hpc$timemod <- strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

## Create File
png(file = "plot2.png")

## Plot
plot(hpc$timemod, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Close File
dev.off()
