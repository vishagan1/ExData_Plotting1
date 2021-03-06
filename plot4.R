library(sqldf)
fileh <- file("household_power_consumption.txt")
df<-sqldf("select * from fileh where Date == '2/2/2007' or Date == '1/2/2007'", file.format = list(header = TRUE, sep = ";"))

png("plot4.png", height = 480, width = 480)
par(mar = c(4,4,2,2))
par(mfrow = c(2,2))

plot(x=df$datetime,y= df$Global_active_power, xlab = "date-time", ylab = "Global Active Power", col = 'black',type = 'l')

plot(x=df$datetime,y=df$Voltage,xlab = "date-time", ylab = "Voltage", col='black',type = 'l')

plot(x=df$datetime,y=df$Sub_metering_1,xlab = "date-time",ylab = "Energy sub metering",type = 'l',col='blue')
lines(x=df$datetime,y=df$Sub_metering_2,type = 'l',col= 'red')
lines(x=df$datetime,y=df$Sub_metering_3,type = 'l', col= 'black')
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), lty = c(1,1,1), col = c('blue','red','black'))

plot(x =df$datetime, y=df$Global_reactive_power, xlab = "date-time",ylab = "Global Recative Power", col = 'black', type = 'l')

dev.off()
