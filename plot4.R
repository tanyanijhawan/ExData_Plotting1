# Store column names
names_vect=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")       

# Read required data
power_data<-read.table("household_power_consumption.txt",col.names=names_vect,sep=";",na.strings="?",skip=66637,nrows=2880)
power_data[,"Date"]<-as.Date(power_data[,"Date"],format='%d/%m/%Y')

# Create Data Time columns 
cols <- c("Date","Time")
power_data$DateTime <- apply( power_data[ , cols ] , 1 , paste , collapse = " " )
power_data[,"DateTime"]<-as.POSIXct(strptime(power_data[,"DateTime"],format="%Y-%m-%d %H:%M:%S"))

# Save "plot4.png"
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")
par(mfrow=c(2,2),mar=c(4,4,4,4))
par(col="black")
plot(power_data$DateTime,power_data$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(power_data$DateTime,power_data$Voltage,type="l",ylab="Voltage",xlab="datetime")
par(col="black")
plot(power_data$DateTime,power_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
par(col="red")
lines(power_data$DateTime,power_data$Sub_metering_2)
par(col="blue")
lines(power_data$DateTime,power_data$Sub_metering_3)
par(col="black")
legend("topright",bty="n", cex=0.8,col = c("black","red", "blue"), lty=c(1,1,1),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
par(col="black")
plot(power_data$DateTime,power_data$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()