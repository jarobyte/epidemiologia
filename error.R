# Este módulo se encarga de tomar un dataframe de observaciones junto con una solución
# de una ecuación diferencial y obtener los vectores
# de errores al cuadrado. Al final los agrega al dataframe.

library(tidyverse)
source("estimacion.R")


## Observaciones simuladas

observaciones_X <- seq(0, 100, by = 0.01)
observaciones_Y <- seq(100, 200, by = 0.01)
observaciones_Z <- seq(200, 300, by = 0.01)

observaciones <- tibble(observaciones_X, observaciones_Y, observaciones_Z)

errores <-  tibble(
  (solucionODE$X - observaciones_X)^2, 
  (solucionODE$Y - observaciones_Y)^2, 
  (solucionODE$Z - observaciones_Z)^2)
