library(lubridate)
library(data.table)


df=fread("household_power_consumption.txt",na.strings = "?")
df$datetime=dmy_hms(paste(df$Date,df$Time))
df$Date=dmy(df$Date)
df$Time=hms(df$Time)
df=df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]


table(is.na(df))
###PLOT-2
temp=df

par(mfrow=c(2,2))
plot(df$datetime,df$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
plot(df$datetime,df$Voltage,type="l",ylab = "Voltage",xlab = "datetime",col="black")
plot(df$datetime,df$Sub_metering_1,type="l",ylab = "Energy sub meeting",xlab = "",col="black")
lines(df$datetime,df$Sub_metering_2,col="red")
lines(df$datetime,df$Sub_metering_3,col="blue")
legend("topright",legend=names(df[,7:9]),col =  c("black","red","blue"),lty=1,cex=0.5)
plot(df$datetime,df$Global_reactive_power,type="l",ylab = "Global_reactive_power",xlab = "datetime",col="black")

dev.copy(png,file="Plot-4.png")
dev.off()


