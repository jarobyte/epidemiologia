library(deSolve)
parameters <- c(a = -8/3, b = -10 , c = 28)
state <- c(X=1,Y=1,Z=1)

Lorenz <- function(t,state,parameters){
  with(as.list(c(state,parameters)),{
    dX <- a*X + y*ZY
    dY <- b*(Y-Z)
    dZ <- -X*Y+c*Y-Z
    
    
  })
  
}


times <- seq()