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
df$Sub_metering_1=as.numeric(df$Sub_metering_1)
df$Sub_metering_2=as.numeric(df$Sub_metering_2)
df$Sub_metering_3=as.numeric(df$Sub_metering_3)

plot(df$datetime,df$Sub_metering_1,type="l",ylab = "Energy sub meeting",xlab = "",col="black")
lines(df$datetime,df$Sub_metering_2,col="red")
lines(df$datetime,df$Sub_metering_3,col="blue")
legend("topright",legend=names(df[,7:9]),col =  c("black","red","blue"),lty=1)
dev.copy(png,file="Plot-3.png")
dev.off()


