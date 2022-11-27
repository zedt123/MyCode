source('Formative 3 - Q2(a)(ii).R')

out <- gibbs(1000,0.99)

out_2 <- data.frame(theta_tilda_1 = 1/sqrt(2)*(out[,1] + out[,2]),
                    theta_tilda_2 = 1/sqrt(2)*(out[,1] - out[,2]))

par(mfrow=c(3,2))
plot(out_2,col=1:1000)
plot(out_2,type="l")
plot(ts(out_2[,1]),xlab="Iteration", ylab = 'theta_tilda_1')
plot(ts(out_2[,2]),xlab="Iteration", ylab = 'theta_tilda_2')
hist(out_2[,1],40,freq=FALSE,main="",xlab="theta_tilda_1")
hist(out_2[,2],40,freq=FALSE,main="",xlab="theta_tilda_2")