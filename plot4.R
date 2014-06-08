#Please maksure the "household_power_consumption.txt" is in the working directory when testing this code

con <- file("household_power_consumption.txt","r")
data <- read.table(con, header=TRUE, sep=";", na.strings="?")
close(con)
p=(as.Date(data$Date,format="%d/%m/%Y")==as.Date("2007-02-01") | as.Date(data$Date,format="%d/%m/%Y")==as.Date("2007-02-02"))
png(filename="plot4.png")
par(mfrow=c(2,2))

#first plot
plot.ts(data$Global_active_power[p],xlab=NULL,ylab="Global Active Power",axes=FALSE)
axis(1,at=c(0,sum(p)/2,sum(p)),lab=c("Thu","Fri","Sat"))
axis(2)
box()

#second plot
plot.ts(data$Voltage[p],xlab="datetime",ylab="Voltage",axes=FALSE)
axis(1,at=c(0,sum(p)/2,sum(p)),lab=c("Thu","Fri","Sat"))
axis(2)
box()

#third plot
plot.ts(data$Sub_metering_1[p],xlab=NULL,ylab="Energy sub metering",axes=FALSE)
lines(data$Sub_metering_2[p],col="red")
lines(data$Sub_metering_3[p],col="blue")
axis(1,at=c(0,sum(p)/2,sum(p)),lab=c("Thu","Fri","Sat"))
axis(2)
box()
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       xjust=1,
       yjust=1,
       bty="n"
)

#fourth plot
plot.ts(data$Global_reactive_power[p],xlab="datetime",ylab="Global_reactive_power",axes=FALSE)
axis(1,at=c(0,sum(p)/2,sum(p)),lab=c("Thu","Fri","Sat"))
axis(2)
box()

dev.off()
