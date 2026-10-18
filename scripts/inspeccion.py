# inspeccion.py — Tipos, columna derivada e indicadores (Python)
# Completa los pasos marcados con TODO. Ejecuta desde la raíz del repositorio:
#   python scripts/inspeccion.py

# TODO 1: carga data/ventas.csv
# TODO 2: imprime los tipos (dtypes) de cada columna
# TODO 3: crea la columna derivada "ticket" = ventas / clientes
# TODO 4: calcula e imprime:
#         - venta promedio por sucursal
#         - ticket promedio (ventas totales / clientes totales)
#         - sucursal con mayor y menor venta
#         - región con mayor venta total

import pandas as pd
#TODO1: carga data/ventas.csv
ventas = pd.read_csv("data/ventas.csv")
print("DataFrame de Ventas")
print(ventas)
print("")

#TODO2: imprime los tipos (dtypes) de cada columna
print("Tipos de datos de cada columna:")
print(ventas.dtypes)
print("")

# TODO 3: crea la columna derivada "ticket" = ventas / clientes
ventas ["ticket"]= ventas["ventas"]/ventas["clientes"]
print("DataFrame con la columna ticket")
print(ventas)
print("") 

# TODO 4: calcula e imprime:
#         - venta promedio por sucursal
ventas_promedio = ventas.groupby("sucursal")["ventas"].mean()
print("Venta Promedio por Sucursal:")
print(ventas_promedio)
print("")
#         - ticket promedio (ventas totales / clientes totales)
ticket_promedio = ventas["ventas"].sum() / ventas["clientes"].sum()
print("Ticket Promedio:", ticket_promedio)
print("")
#         - sucursal con mayor y menor venta

print("La sucursal con mayor venta es:", ventas.loc[ventas["ventas"].idxmax(), "sucursal"])
print("La sucursal con menor venta es:", ventas.loc[ventas["ventas"].idxmin(), "sucursal"])
print("")

#         - región con mayor venta total
ventas_per_region = ventas.groupby("region").sum("ventas")
print("La región con mayor venta total es:", ventas_per_region["ventas"].idxmax())
