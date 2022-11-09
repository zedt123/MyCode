# Use inverse sampling to sample from q(θ)

sample_q <- function(){
  u <- runif(1,0,1)
  x <- pi/2*sqrt(u)
  return(x)
}



Q2b <- function(N=1000, theta0=pi/4){
  theta <- rep(0, N)
  theta[1] <- theta0
  count <- 0
  for(i in 2:N){
    can <- sample_q()
    aprob <- theta[i-1]/can * sin(can)/sin(theta[i-1])
    if(runif(1)<aprob){
      theta[i]=can # Store candidate value
      count=count+1
    }else{
      theta[i]=theta[i-1]
    }
  }
  print(count/(N-1))
  return(theta)
}

set.seed(4321)
out <- Q2b()
