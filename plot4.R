uc<-read.csv(choose.files(),header=T,sep=";",na.strings = "?")
head(uc)

uc$Date <- as.Date(uc$Date, format ="%d/%m/%Y")
uc2<- subset(uc, Date == "2007-02-01"|Date=="2007-02-02"|Date=="2007-02-03")
uc2$days <- paste(uc2$Date,uc2$Time)
uc2$days <- strptime(uc2$days,format = "%Y-%m-%d %H:%M:%S")


tail(uc2)


par(mfrow=c(2,2),mar=c(4,4,2,1))


with(subset(uc2,days<="2007-02-03 00:00:00 EST"),{
     plot(days,as.numeric(Global_active_power),
      type="l",xlab="",ylab="Global Active Power(Kilowatts)")  
      
     plot(days, as.numeric(Voltage),
      type="l",xlab="datetime",ylba="Voltage")
  
     plot(days, as.numeric(Sub_metering_1),
          type="n",xlba="",ylab="Global Active Power(Kilowatts)")

      lines(days, as.numeric(Sub_metering_1))
      lines(days,as.numeric(Sub_metering_2),col="red")
      lines(days,as.numeric(Sub_metering_3),col="blue")
      legend("topright",cex=0.5,lty=1,col=c("black","red","blue"),
             legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

      plot(days,as.numeric(Global_reactive_power),
           type="l",xlab="datetime",ylab="Global_reactive_power")
      })


dev.copy(png,file="plot4.png",width=480,height=480,units="px")
dev.off()