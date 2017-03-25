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

par(mfrow=c(2, 1))
par(mar = c(4, 4, 2, 0), oma = c(0, 0, 0, 0.5))  # Marginaalien asetuksia

plot(y=Residual, x=Temperature, xlab=expression(paste("Temperature (",degree,"C)", sep="")),ylab="")
mtext(expression('Residual (mg CO '[2]*' m'^-2*'s'^-1*')'),side=2, line=2.5)
# mtext(expression('Temperature ('^o*'C)'),side=1, line=2.5)
legend("topright", "(a)", bty = "n")

plot(y=Residual, x=PAR, xlab="",ylab="")
mtext(expression('Residual (mg CO '[2]*' m'^-2*'s'^-1*')'),side=2, line=2.5)
mtext(expression(paste('PAR (',mu,'mol m'^-2*' s'^-1*')'), sep=""),side=1, line=2.5)
legend("topright", "(b)", bty = "n")
