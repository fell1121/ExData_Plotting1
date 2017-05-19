uc<-read.csv(choose.files(),header=T,sep=";",na.strings = "?")
head(uc)

ucs<- subset(uc, Date == "1/2/2007"|Date=="2/2/2007")
with(uc,hist(as.numeric(ucs$Global_active_power),
             col="red",
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)"))

dev.copy(png,file="plot1.png",width=480,height=480,units="px")
dev.off()
head(ucs)