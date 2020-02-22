# Store required column names
names_vect=c("Date","Time","Global_active_power","Global_reactive_power",
             "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")       


# Read required data
power_data<-read.table("household_power_consumption.txt",col.names=names_vect,sep=";",na.strings="?",skip=66637,nrows=2880)
power_data[,"Date"]<-as.Date(power_data[,"Date"],format='%d/%m/%Y')

# Construct required histogram
hist(power_data$Global_active_power,main="Global Active Power",col="red",
     xlab="Global Active Power(kilowatts)",ylab="Frequency")

par(mfrow=c(1,1))
# Save as "plot1.png"
png(filename = "plot1.png",width = 480, height = 480, bg = "transparent")
hist(power_data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency")
dev.off()