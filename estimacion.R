library(deSolve)
library(tidyverse)
## aquí abajo se pone el modelo
## S = susceptibles, I = infectados, , M = muertos
SIM <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- a * S - b * S * I
    dI <- (-c) * I + b * S * I
    dM <- c * I
    list(c(dS, dI, dM))
  })
}
parameters <- c(a = -8/3, b = -10, c = 28)
state <- c(S = 1, I = 1, M = 1)
times <- seq(0, 100, by = 0.01)
solucionODE <- ode(y = state, times = times, func = SIM, parms = parameters) %>% as.tibble()
#plot(out)