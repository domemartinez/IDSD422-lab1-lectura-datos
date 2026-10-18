# inspeccion.R — Tipos, columna derivada e indicadores (R)
# Completa los pasos marcados con TODO. Ejecuta desde la raíz del repositorio:
#   Rscript scripts/inspeccion.R

# TODO 1: carga data/ventas.csv
# TODO 2: imprime la estructura (str) para ver los tipos
#         (fija si region llegó como character o factor)
# TODO 3: crea la columna derivada "ticket" = ventas / clientes
# TODO 4: calcula e imprime:
#         - venta promedio por sucursal (aggregate o dplyr)
#         - ticket promedio (ventas totales / clientes totales)
#         - sucursal con mayor y menor venta
#         - región con mayor venta total


# TODO 1: carga data/ventas.csv
install.packages("readr")
install.packages("dplyr")
library(readr)
library (dplyr)
ventas <- read_csv("data/ventas.csv")
print ("DataFrame de Ventas")
print(ventas)
cat("\n")

# TODO 2: imprime la estructura (str) para ver los tipos
print ("Tipos de datos de cada columna:")
str(ventas)
print ("region llegó como character")
cat("\n")

# TODO 3: crea la columna derivada "ticket" = ventas / clientes
ventas$ticket <- ventas$ventas / ventas$clientes
print ("DataFrame con la columna ticket")
print(ventas)
cat("\n")

# TODO 4: calcula e imprime:
#         - venta promedio por sucursal (aggregate o dplyr)

promedio_por_sucursal <- ventas %>%
  group_by(sucursal) %>%
  summarise(ventas = mean(ventas))
print("Venta Promedio por Sucursal:")
print(promedio_por_sucursal)
cat("\n")

#          - ticket promedio (ventas totales / clientes totales)
ticket_promedio <- sum(ventas$ventas) / sum(ventas$clientes)
cat(sprintf("Ticket Promedio: %.4f\n\n", ticket_promedio))

#         - sucursal con mayor y menor venta
sucursal_mayor <- ventas %>% slice_max(ventas, n = 1)
sucursal_menor <- ventas %>% slice_min(ventas, n = 1)
cat(sprintf("La sucursal con mayor venta es: %s\n", sucursal_mayor$sucursal))
cat(sprintf("La sucursal con menor venta es: %s\n\n", sucursal_menor$sucursal))

#        - región con mayor venta total
ventas_per_region <- ventas %>%
  group_by(region) %>%
  summarise(total_ventas = sum(ventas))

region_mayor <- ventas_per_region %>% slice_max(total_ventas, n = 1)
cat(sprintf("La región con mayor venta total es: %s\n", region_mayor$region))
