#Please maksure the "household_power_consumption.txt" is in the working directory when testing this code

con <- file("household_power_consumption.txt","r")
data <- read.table(con, header=TRUE, sep=";", na.strings="?")
close(con)
p=(as.Date(data$Date,format="%d/%m/%Y")==as.Date("2007-02-01") | as.Date(data$Date,format="%d/%m/%Y")==as.Date("2007-02-02"))
png(filename="plot2.png")
plot.ts(data$Global_active_power[p],xlab=NULL,ylab="Global Active Power (kilowatts)",axes=FALSE)
axis(1,at=c(0,sum(p)/2,sum(p)),lab=c("Thu","Fri","Sat"))
axis(2)
box()
dev.off()
