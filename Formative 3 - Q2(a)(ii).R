gibbs <- function(N,rho){
  psi_1_star <- 0
  psi_2_star <- 0
  samples <- matrix(ncol = 2, nrow = N)
  colnames(samples) <- c('psi_1','psi_2')
  samples[1,] <- c(psi_1_star, psi_2_star)
  
  for(i in 2:N){
    psi_1_star <- rnorm(1,0,sqrt(1+rho))
    psi_2_star <- rnorm(1,0,sqrt(1-rho))
    samples[i,] <- c(psi_1_star, psi_2_star)
  }
  return(samples)
}

out <- gibbs(1000,0.99)

par(mfrow=c(3,2))
plot(out,col=1:1000)
plot(out,type="l")
plot(ts(out[,1]),xlab="Iteration")
plot(ts(out[,2]),xlab="Iteration")
hist(out[,1],40,freq=FALSE,main="",xlab="psi_1")
hist(out[,2],40,freq=FALSE,main="",xlab="psi_2")
