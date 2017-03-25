setwd('input/')

datafile<-read.table("Fig_2_photosynthesis.txt", header=TRUE)

# please note that the excat time might be off 
# since we have estimated the time such that all measurements (app. 180) appear regularly throughout the day 
time<-strptime(datafile$time, format="%X")
A_meas<-datafile$A_p_meas  ## measured photosynthesis on day A  (mg CO2 m-2 s-1)
A_pred<-datafile$A_p_pred  ## predicted photosynthesis on day A  (mg CO2 m-2 s-1)
B_meas<-datafile$B_p_meas  ## measured photosynthesis on day B  (mg CO2 m-2 s-1)
B_pred<-datafile$B_p_pred  ## predicted photosynthesis on day B  (mg CO2 m-2 s-1)

par(mfrow=c(2, 1))
par(mar = c(0.5, 4, 2, 0), oma = c(2, 0, 0, 0.5))  # Marginaalien asetuksia

plot(y=A_meas, x=time, col="blue", ylim=c(-5,90), type="l",xlab="",ylab="")
lines(y=A_pred, x=time, col="black")
mtext(expression('Photosynthesis (mg CO '[2]*' m'^-2*'day'^-1*')'),side=2, line=2)
legend("topleft", paste("(a)"), bty = "n")
legend("topright", c("observed","predicted"), col=c("blue","black"), lty=1, bty = "n")

plot(y=B_meas, x=time, col="blue", ylim=c(-5,90), type="l",xlab="Hour (hh:mm)",ylab="")
lines(y=B_pred, x=time, col="black")
legend("topleft", paste("(b)"), bty = "n")
mtext(expression('Photosynthesis (mg CO '[2]*' m'^-2*'day'^-1*')'),side=2, line=2)
