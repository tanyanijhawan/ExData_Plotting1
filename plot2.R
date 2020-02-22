# Store column names
names_vect=c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
             "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")       

# Read required data
power_data<-read.table("household_power_consumption.txt",col.names=names_vect,sep=";",
                       na.strings="?",skip=66637,nrows=2880)
power_data[,"Date"]<-as.Date(power_data[,"Date"],format='%d/%m/%Y')


# Create separate date time columns
cols <- c("Date","Time")
power_data$DateTime <- apply( power_data[ , cols ] , 1 , paste , collapse = " " )
power_data[,"DateTime"]<-as.POSIXct(strptime(power_data[,"DateTime"],format="%Y-%m-%d %H:%M:%S"))

par(mfrow=c(1,1))
# Save "plot2.png"
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")
plot(power_data$DateTime,power_data$Global_active_power,type="l",ylab="Global Active Power(kilowatts)",xlab="")
dev.off()