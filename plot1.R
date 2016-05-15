library(sqldf)
fileh <- file("household_power_consumption.txt")
df <- df<-sqldf("select * from fileh where Date <= '2/2/2007' and Date >= '1/2/2007'", file.format = list(header = TRUE, sep = ";"))

png("plot1.png",width = 480, height = 480)
hist(df$Global_active_power,xlab = "Global Active Power (kilowatts)", col = 'red', main = "Global Active power")
dev.off()
