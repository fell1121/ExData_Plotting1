uc<-read.csv(choose.files(),header=T,sep=";",na.strings = "?")
head(uc)

uc$Date <- as.Date(uc$Date, format ="%d/%m/%Y")
uc2<- subset(uc, Date == "2007-02-01"|Date=="2007-02-02"|Date=="2007-02-03")
uc2$days <- paste(uc2$Date,uc2$Time)
uc2$days <- strptime(uc2$days,format = "%Y-%m-%d %H:%M:%S")


tail(uc2)
par(mfrow=c(1,1))
with(subset(uc2,days<="2007-02-03 00:00:00 EST"),{
     plot(days,as.numeric(Sub_metering_1),
      type="n",xlab="",ylab="Global Active Power(Kilowatts)")  
      
      lines(days, as.numeric(Sub_metering_1))
      lines(days,as.numeric(Sub_metering_2),col="red")
      lines(days,as.numeric(Sub_metering_3),col="blue")
      legend("topright",lty=1,col=c("black","red","blue"),
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

help(legend)

dev.copy(png,file="plot2.png",width=480,height=480,units="px")
dev.off()