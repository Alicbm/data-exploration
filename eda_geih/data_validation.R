#######################################################

# VALIDACIÓN DE DATA

#######################################################

# 1. Verificar la Estructura de los Datos

### Columnas comunes

# Para esto tomamos cualquier mes, con el objetivo de verificar cuántas variables tiene ese mes 
# y ver si sigue manteniendo la misma cantidad en la data consolidada.

# Generamos el mes que elegimos
febrero <- merge_month("febrero")

# Verificamos el número de columnas
ncol(febrero) # 526

# Mostramos los nombres de las columnas
names(febrero)

# Ahora hacemos lo mismo con la data consolidada
ncol(data) # 526

# Mostramos los nombres de las columnas
names(data)

#### Tipo de datos

# Verificamos la estructura de los datos del mes de febrero
str(febrero)

# Verificamos la estructura de los datos consolidados
str(data)

meses <- C(enero, febrero, marzo, abrir, mayo, junio)

verificar_variables <- function(data, mes){
  
for (mes in data) {
  
    
      if(names %in% names(mes)) {
      
        print("las variables son las misma")
        } else {
      
            print("las variables no son las misma")
     }
    
    
  }

}

verificar_variables(data,enero)
  
#función 

# 2. Conteo de Registros

# Para esto vamos a sumar las observaciones de todos los meses, las cuales tienen que coincidir con la data consolidada.

# Generamos los datos de cada mes
enero <- merge_month("enero")
febrero <- merge_month("febrero")
marzo <- merge_month("marzo")
abril <- merge_month("abril")
mayo <- merge_month("mayo")
junio <- merge_month("junio")

# Sumamos el número de observaciones de todos los meses
total_de_obs_original <- nrow(enero) + nrow(febrero) + nrow(marzo) + nrow(abril) + nrow(mayo) + nrow(junio)

# Obtenemos el número de observaciones de la data consolidada
total_de_obs_pegado <- nrow(data)

# Comparamos las observaciones
if (total_de_obs_original == total_de_obs_pegado) {
  print("La cantidad de observaciones es la correcta")
} else {
  print("La cantidad de observaciones no es la correcta")
}


#función 
# 3. Duplicados

#### Verificar duplicados

# Identificamos duplicados en la data consolidada
duplicado <- data[duplicated(data)]

# Verificamos si hay duplicados
if (nrow(duplicado) == 0) {
  print("No hay duplicados por fila")
} else {
  print("Hay duplicados por fila")
}

# 4. Completitud de Datos

#### Verificar valores faltantes: Asegúrate de que no haya valores faltantes en columnas clave.

# NOTA: SIEMPRE HABRÁ VALORES NULOS, PERO LA FINALIDAD ES IDENTIFICARLOS Y VER SI LAS VARIABLES CLAVE ESTÁN COMPLETAS.

# Contamos los valores faltantes en cada columna
data[, sapply(.SD, function(x) sum(is.na(x)))]
función

# 5. Validación de Contenidos

# Vamos a mirar la cantidad de ocupados en enero por departamento, tanto en la data consolidada como en la data específica de enero.

# Sumamos los ocupados en enero por departamento en la data específica de enero
enero[, .(muestra_enero = sum(OCI, na.rm = TRUE)), by = DPTO]

# Sumamos los ocupados en enero por departamento en la data consolidada
data[MES == 1, .(muestra_enero = sum(OCI, na.rm = TRUE)), by = DPTO]
#función 




