library(sqldf)
fileh <- file("household_power_consumption.txt")
df <- df<-sqldf("select * from fileh where Date == '2/2/2007' or Date == '1/2/2007'", file.format = list(header = TRUE, sep = ";"))

df[,"datetime"]<-paste(df$Date,df$Time)
df[,"datetime"]<-as.POSIXct(df$datetime,format = "%d/%m/%Y %H:%M:%S")
png("plot2.png",width = 480, height = 480)
plot(y=df$Global_active_power,x=df$datetime, ylab = "Global Active Power (kilowatts)", type ='l',col = 'black', xlab = "date-time")
dev.off()