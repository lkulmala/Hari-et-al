setwd('input/')
datafile<-read.table("Fig_4_and_5_testing.txt", header=TRUE)

colnames(datafile)

# please note that the excat time might be off 
# since we have estimated the time such that all measurements (app. 180) appear regularly throughout the day 
time<-strptime(datafile$time, format="%X")
meas<-datafile$p_meas  ## measured photosynthesis (mg CO2 m-2 s-1)
pred<-datafile$p_pred  ## predicted photosynthesis (mg CO2 m-2 s-1)
PAR<-datafile$PAR  ## Photosyntheticall active radiation (umol m-2 s-1)
Temperature<-datafile$Temp  ## Air tempetature (oC)
Residual<-datafile$Residual  ## Difference between measured and modelled (mg CO2 m-2 s-1)


par(mfrow=c(1, 1))
par(mar = c(4, 4, 2, 0), oma = c(0, 0, 0, 0.5))  # Marginaalien asetuksia

plot(y=meas, x=pred, ylim=c(-5,110),xlim=c(-5,110),xlab="",ylab="")
lines(y=c(-5,1000),x=c(-5,1000),lty=2, col="red")
mtext(expression('Measured (mg CO '[2]*' m'^-2*'s'^-1*')'),side=1, line=2.5)
mtext(expression('Predicted (mg CO '[2]*' m'^-2*'s'^-1*')'),side=2, line=2.5)
legend("topleft", expression('R'^2*'=0.95'), bty = "n")
