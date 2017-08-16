# Este módulo se encarga de tomar un dataframe de observaciones junto con una solución
# de una ecuación diferencial y obtener los vectores
# de errores al cuadrado. Al final los agrega al dataframe.

library(tidyverse)
source("estimacion.R")


## Observaciones simuladas

observaciones_S <- seq(0, 100, by = 0.01)
observaciones_I <- seq(100, 200, by = 0.01)
observaciones_M <- seq(200, 300, by = 0.01)

observaciones <- tibble(observaciones_S, observaciones_I, observaciones_M)

errores <-  tibble(
  (solucionODE$S - observaciones_S)^2, 
  (solucionODE$I - observaciones_I)^2, 
  (solucionODE$M - observaciones_M)^2
  ) %>% 
  rename(error_en_S = `(solucionODE$S - observaciones_S)^2`,
         error_en_I = `(solucionODE$I - observaciones_I)^2`,
         error_en_M = `(solucionODE$M - observaciones_M)^2`
         )


