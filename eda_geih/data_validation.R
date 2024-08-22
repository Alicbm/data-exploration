
#######################################################


#VALIDACIÓN DE DATA

#######################################################

# 1. Verificar la Estructura de los Datos

### Columnas comunes

# Para esto tomamos  cualquier mes, con el obejtivo de que miremos si cuantas varibales tiene ese mes y ver si sigue manteniedo la misma cantoida en la data pegada 

#Generamos el mese que eligamos 

febrero  <- merge_month("febrero")

ncol(febrero) #519

names(febrero)

# ahora ahacemos lo mismo con la data pegada
ncol(data) #519

names(data)

#### Tipo de datos}

str(febrero)

str(data)

# 2. Conteo de Registros

# Para esto vamos hacer un sumado de las observaciones de todos los mese el cuall tiene que coincidir con la data pegada

enero <- merge_month("enero")

febrero <- merge_month("febrero")

marzo <- merge_month("marzo")

abril <- merge_month("abril")

mayo <- merge_month("mayo")

junio <- merge_month("junio")

total_de_obs_origina <- nrow(enero) + nrow(febrero) + nrow(marzo) + nrow(abril) + nrow (mayo) + nrow (junio) 

total_de_obs_pegado <- nrow(data)

if (total_de_obs_origina == total_de_obs_pegado){
  print("La cantidad de observaciones son las correctas")
} else {
  print("La cantidad de observaciones no es la correcta ")
}

# 3. Duplicados

####Verificar duplicados

duplicado <- data[duplicated(data)]

if (nrow(duplicado)==0){
  print("no hay duplicado por fila")
} else {
  print("hay duplicado por fila")
}


# 4. Completitud de Datos

#### Verificar valores faltantes: Asegúrate de que no haya valores faltantes en columnas clave.

##NOTA: SIEMPRE VA VER VALORES NULOS, PERO EL FINALIDAD, IDENTIFICARLOS Y MIRAR SI ES VARIABLES CLAVES ESTAN.

data[, sapply(.SD, function(x) sum(is.na(x)))]



