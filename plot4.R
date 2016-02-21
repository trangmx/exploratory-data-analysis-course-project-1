electric_consumption_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_data <- data[electric_consumption_data$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(sub_data$Date, sub_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_active_power <- as.numeric(sub_data$Global_active_power)

voltage <- as.numeric(sub_data$Voltage)

global_reactive_power <- as.numeric(sub_data$Global_reactive_power)

sub_Metering1 <- as.numeric(sub_data$Sub_metering_1)
sub_Metering2 <- as.numeric(sub_data$Sub_metering_2)
sub_Metering3 <- as.numeric(sub_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.25)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, sub_Metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_Metering2, type="l", col="red")
lines(date_time, sub_Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1.5, col=c("black", "red", "blue"), bty="n")

plot(date_time, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

