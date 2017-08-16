library(tidyverse)

prueba <- read_delim(
  "datos/datos1.csv", 
  delim = " ", 
  col_names = c("anio", "notificados", "diagnosticados"))
