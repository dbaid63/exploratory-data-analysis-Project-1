library(lubridate)
library(data.table)

df=fread("household_power_consumption.txt",na.strings = "?")
df$Date=dmy(df$Date)
df=df[df$Date=="2007-02-01" | df$Date=="2007-02-02",]
df$Time=hms(df$Time)
table(is.na(df))
###PLOT-1

df$Global_active_power=as.numeric(df$Global_active_power)
hist(df$Global_active_power,main= "Global Active Power",col="red",xlab = "Global Active Power (kilowatts)")
dev.copy(png,file="Plot-1.png")
dev.off()


