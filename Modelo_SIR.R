library(deSolve)
parameters <- c(Ts_infeccion = 0.001,  Ts_muerte= 0.01 , beta = 1)
state <- c(S=10000,I=10,R = 0)

SIR <- function(t,state,parameters){
  with(as.list(c(state,parameters)),{
    dS <- beta*S-Ts_infeccion*S*I
    dI <- Ts_infeccion*S*I - Ts_muerte*I
    dR <- Ts_muerte*I
    
    
    list(c(dS,dI,dR))
  }) 
}


times <- seq(0,2, by = 0.01)

out <- ode(y = state, times = times, func = SIR, parms = parameters)
par(oma = c(0, 0, 3, 0))
plot(out, xlab = "time", ylab = "-")