library(deSolve)
library(tidyverse)
## aquí abajo se pone el modelo
## S = susceptibles, I = infectados, , R = muertos
parameters <- c(a = 1, b = 0.001, c = 0.01)
state <- c(S = 10000, I = 10, M = 0)

SIM <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    dS <- a * S - b * S * I
    dI <- (-c) * I + b * S * I
    dM <- c * I
    list(c(dS, dI, dM))
  })
}

times <- seq(0, 2, by = 0.01)
solucionODE <- ode(y = state, times = times, func = SIM, parms = parameters)
datosODE <- solucionODE %>% as.data.frame() %>% as.tibble()

ggplot(datosODE, aes(time, S)) + geom_point()
ggplot(datosODE, aes(time, I)) + geom_point()
ggplot(datosODE, aes(time, M)) + geom_point()
