library(lubridate)
library(data.table)


df=fread("household_power_consumption.txt",na.strings = "?")
df$datetime=dmy_hms(paste(df$Date,df$Time))
df$Date=dmy(df$Date)
df$Time=hms(df$Time)
df=df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]


table(is.na(df))
###PLOT-2

df$Global_active_power=as.numeric(df$Global_active_power)
plot(df$datetime,df$Global_active_power,type="l",ylab = "Global Active Power (kilowatts)",xlab = "")
dev.copy(png,file="Plot-2.png")
dev.off()


