# leer_csv.R — Cargar el reporte CSV del ERP (R)
# Completa los pasos marcados con TODO. Ejecuta desde la raíz del repositorio:
#   Rscript scripts/leer_csv.R

# TODO 1: carga data/ventas.csv con readr::read_csv en un data.frame
# TODO 2: imprime las dimensiones (dim) del data.frame
# TODO 3: imprime las primeras filas (head) para revisar las columnas

#Leer csv en r
install.packages("readr")
library(readr)
ventas <- read_csv("data/ventas.csv")
#Muestra la cabeza del csv, los primeros valores
head(ventas)
#Muestra la dimensión 
dim(ventas)
#Muestra la estructura
str(ventas)
