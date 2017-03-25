
setwd('input/')

datafile<-read.table("Fig_1_State_of_photosynthetic.txt", header=TRUE)

S2011<-datafile$X2011
S2012<-datafile$X2012
S2013<-datafile$X2013
S2014<-datafile$X2014

days<-seq(as.Date("2014-04-01"), as.Date("2014-10-16"), by="days", format="%m-%d-%Y")
xlimits<-c(as.Date("2014-03-25", sep=""),as.Date("2014-10-20", sep=""))

par(mfrow=c(1, 1))
par(mar = c(0.5, 4, 2, 0), oma = c(2, 0, 0, 0.5))  # Marginaalien asetuksia

plot(y=S2011, x=days, col="cornflowerblue", ylim=c(-0,3500), xlim=xlimits, type="l",xlab="",ylab="State of photosynthetic machinery")
lines(y=S2012, x=days, col="chocolate3")
lines(y=S2013, x=days, col="black")
lines(y=S2014, x=days, col="black", lty=2)
legend("topleft", c("2011","2012","2013","2014"), col=c("chocolate3","cornflowerblue","black","black"), lty=c(1,1,1,2), bty = "n")
