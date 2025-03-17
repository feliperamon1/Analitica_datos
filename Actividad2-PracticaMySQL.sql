use analiticadedatos; # Cambia a la base de datos "analiticadedatos"

SELECT * FROM analiticadedatos.uberdataset;

# Pregunta 1: ¿Cuál es la distancia total recorrida para viajes de negocios (Business) y viajes personales (Personal)?
SELECT CATEGORY, SUM(MILES) AS Total_Miles # Selecciona la categoría y suma las millas
FROM UberDataset # De la tabla UberDataset
GROUP BY CATEGORY; # Agrupa los resultados por categoría

#Pregunta 2: ¿Cuáles son los 5 viajes más largos (en millas) y cuál fue su propósito?
SELECT START, STOP, MILES, PURPOSE # Selecciona el inicio, fin, millas y propósito
FROM UberDataset # De la tabla UberDataset
ORDER BY MILES DESC # Ordena los resultados por millas en orden descendente
LIMIT 5; # Limita los resultados a los 5 viajes más largos

# BUSQUEDAS RELACIONADAS

#Viajes por propósito
SELECT PURPOSE, COUNT(*) AS Total_Trips  #Selecciona el propósito y cuenta el número de viajes
FROM UberDataset  # De la tabla UberDataset
GROUP BY PURPOSE  # Agrupa los resultados por propósito
ORDER BY Total_Trips DESC;  #  Ordena los resultados por el número de viajes en orden descendente

# Rutas más frecuentes:
SELECT START, STOP, COUNT(*) AS Total_Trips  # Selecciona el inicio, fin y cuenta el número de viajes
FROM UberDataset  # De la tabla UberDataset
GROUP BY START, STOP  # Agrupa los resultados por combinación de inicio y fin
ORDER BY Total_Trips DESC  # Ordena los resultados por el número de viajes en orden descendente
LIMIT 10;  # Limita los resultados a las 10 rutas más frecuentes

#Viajes por mes:
SELECT MONTH(STR_TO_DATE(START_DATE, '%W, %M %e, %Y')) AS Month, COUNT(*) AS Total_Trips  # Extrae el mes de la fecha y cuenta los viajes
FROM UberDataset  # De la tabla UberDataset
GROUP BY Month  # Agrupa los resultados por mes
ORDER BY Month;  # Ordena los resultados por mes

