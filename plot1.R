#Please maksure the "household_power_consumption.txt" is in the working directory when testing this code

con <- file("household_power_consumption.txt","r")
data <- read.table(con, header=TRUE, sep=";", na.strings="?")
close(con)
p=(as.Date(data$Date,format="%d/%m/%Y")==as.Date("2007-02-01") | as.Date(data$Date,format="%d/%m/%Y")==as.Date("2007-02-02"))
png(filename="plot1.png")
data2=data$Global_active_power[p]
hist(data2,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.off()
