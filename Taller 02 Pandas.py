## importar librerias

import pandas as pd

ruta = r"C:\Users\gende\Downloads\Walmart_Sales.csv"

walmart_sales = pd.read_csv(ruta)

print(walmart_sales.head())

## explorar base de datos

print("Primeras filas")
print(walmart_sales.head())

print("\nInformación del dataset")
print(walmart_sales.info())

print("\nValores nulos")
print(walmart_sales.isnull().sum())

## limpieza de datos(eliminar posibles valores duplicados y nulos)

# Eliminar filas duplicadas
walmart_sales = walmart_sales.drop_duplicates()

# Reemplazar posibles valores nulos
walmart_sales["Temperature"] = walmart_sales["Temperature"].fillna(
    walmart_sales["Temperature"].mean()
)


# Mostrar únicamente las ventas mayores a 2 millones
ventas_altas = walmart_sales[walmart_sales["Weekly_Sales"] > 2000000]

print("\nVentas mayores a 2 millones")
print(ventas_altas.head())


# Crear una columna indicando si la temperatura fue alta o baja

walmart_sales["Clima"] = walmart_sales["Temperature"].apply(
    lambda x: "Caluroso" if x >= 60 else "Frío"
)

print("\nNueva columna creada")
print(walmart_sales.head())


## PREGUNTA 1 ¿Cuál es la temperatura promedio por tienda?

print("\nTemperatura promedio por tienda")

temperatura = walmart_sales.groupby("Store")["Temperature"].mean()

print(temperatura)

## Permite conocer cuál fue la temperatura promedio registrada en cada tienda, afectando de esta manera el flujo de clientes y por la tanto las ventas.


## PREGUNTA 2 ¿Cuál fue el precio promedio del combustible por tienda?


print("\nPrecio promedio del combustible por tienda")

combustible = walmart_sales.groupby("Store")["Fuel_Price"].mean()

print(combustible)

## Se observa el precio promedio del combustible para cada tienda.


## PREGUNTA 3 ¿Cuántos registros tiene cada tienda?

print("\nCantidad de registros por tienda")

registros = walmart_sales.groupby("Store")["Store"].count()

print(registros)

## Permite identificar cuántas semanas de información tiene cada tienda.

