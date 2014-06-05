## Read File
hpc  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Create Data Subset For Graphing
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## Put $Time Column In Correct Format
hpc$timemod <- strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

## Create Graph File
png(file = "plot4.png")

## Create Layout
par(mfrow = c (2,2))

## Plot 1,1 Graph
plot(hpc$timemod, hpc$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

## Plot 1,2 Graph
plot(hpc$timemod, hpc$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## Plot 2,1 Graph
plot(hpc$timemod, hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(hpc$timemod, hpc$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red")
lines(hpc$timemod, hpc$Sub_metering_3, xlab = "",  ylab = "Energy sub metering",type = "l", col = "blue")
legend("topright", lty = 1, bty = "n", col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## Plot 2,2, Graph
plot(hpc$timemod, hpc$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

## Close File
dev.off()