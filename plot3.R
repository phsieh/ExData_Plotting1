## Read File
hpc  <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

## Create Data Subset For Graphing
hpc <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")

## Put $Time Column In Correct Format
hpc$timemod <- strptime(paste(hpc$Date,hpc$Time), format = "%d/%m/%Y %H:%M:%S")

## Create Graph File
png(file = "plot3.png")

## Plot Graph
plot(hpc$timemod, hpc$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", col = "black")
lines(hpc$timemod, hpc$Sub_metering_2, xlab = "", ylab = "Energy sub metering", type = "l", col = "red")
lines(hpc$timemod, hpc$Sub_metering_3, xlab = "",  ylab = "Energy sub metering",type = "l", col = "blue")
legend("topright", lty = 1,col = c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

## Close File
dev.off()