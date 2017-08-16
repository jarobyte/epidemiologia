# Este módulo se encarga de tomar los parámetros y las condiciones iniciales
# y calcular el error

library(tidyverse)
library(deSolve)

## Observaciones simuladas

#observaciones_S <- seq(0, 100, by = 0.01)
# observaciones_I <- seq(100, 200, by = 0.01)
# observaciones_R <- seq(200, 300, by = 0.01)

observaciones_S <- rep.int(0, 10001)
observaciones_I <- rep.int(0, 10001)
observaciones_R <- rep.int(0, 10001)

observaciones <- tibble(observaciones_S, observaciones_I, observaciones_R)
## Primero definimos el modelo

SIR <- function(t, state, parameters) {
  with(as.list(c(state, parameters)), {
    # dS <- a * S - b * I * R
    # dI <- (-c)*I + b * I * R
    # dR <- c * I
    dS <- 0
    dI <- 0
    dR <- 0
    list(c(dS, dI, dR))
  })
}

## Definimos el rango de tiempo y condiciones iniciales de prueba

tiempo <- seq(0, 100, by = 0.01)
parametros <- c(a = -8/3, b = -10, c = 28)
condicionesIniciales <- c(S = 2, I = 2, R = 2)

## Ahora definimos la funcion

error <- function(parametros, condicionesIniciales, observaciones){
  out <- ode(y = condicionesIniciales, times = tiempo, func = SIR, parms = parametros)
  solucionODE <- out %>% 
    as.data.frame()
    error_S = (solucionODE$S - observaciones[1])^2
    error_I = (solucionODE$I - observaciones[2])^2 
    error_R = (solucionODE$R - observaciones[3])^2
  sum(error_S + error_I + error_R)
}

