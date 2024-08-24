#######################################################
# VALIDACIÓN DE DATA
#######################################################

install.packages("data.table")
library(data.table)
data <- fread (file = "C:/data-exploration/geih_complete.csv" )

getwd()


# 1. Verificar la Estructura de los Datos

### Columnas comunes
# Este paso verifica si los nombres de las columnas en los datos de cada mes son iguales a los de la data consolidada.
# Se toma cada mes de datos para asegurar que la estructura de columnas es consistente.


base_dir <- file.path(getwd(), "datos")

months <- list.dirs(path = base_dir, full.names = FALSE, recursive = FALSE)

Verify_variables <- function() {
  
  
  for (month in months) {
    
    # Aquí se asume que merge_month carga los datos del mes específico
    month_data <- merge_month(month)
    
    # Verifica si los nombres de columnas en los datos del mes están en la data consolidada
    if (all(names(month_data) %in% names(data))) {
      print(paste("Las variables son las mismas que las del mes de", month))
    } else {
      print(paste("Las variables no son las mismas que las del mes de", month))
    }
  }
}

Verify_variables()



# 2. Conteo de Registros

# Este paso suma el número de observaciones de cada mes para asegurarse de que coincida con el número total de observaciones en la data consolidada.

observaciones <- function() {
  
  
  total_obs <- 0
  
  for (month in months) {
    
    # Aquí se asume que merge_month carga los datos del mes específico
    month_data <- merge_month(month)
    
    # Suma el número de filas de los datos de cada mes
    total_obs <- total_obs + nrow(month_data)
  } 
  
  # Compara el total de observaciones con el número de filas en la data consolidada
  if (total_obs == nrow(data)) {
    print("El número de observaciones es correcto")
  } else {
    print("El número de observaciones no es correcto")
  }
}

observaciones()

# 3. Duplicados

#### Verificar duplicados
# Identifica si hay filas duplicadas en la data consolidada.

duplicate <- function(data) {
  
  duplicate <- data[duplicated(data)]
  
  # Verifica si hay filas duplicadas
  if (nrow(duplicate) == 0) {
    print("No hay duplicados por fila")
  } else {
    print("Hay duplicados por fila")
  }
}

duplicate(data)


# 4. Completitud de Datos

#### Verificar valores faltantes
# Este paso cuenta los valores faltantes en columnas clave para asegurarse de que no haya datos faltantes.

missing_values <- function(data, ...) {
  
  data[, lapply(.SD, function(x) sum(is.na(x))), .SDcols = c(...)]
  
}

# Contamos valores faltantes en las columnas especificadas
missing_values(data, "DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "FEX_C18")


# 5. Validación de Contenidos

# Comparamos la cantidad de ocupados en enero por departamento entre la data consolidada y la data específica de enero.

validation <- function(data, month, by_col, ...) {
  
  months_dictionary <- list(
    "enero" = 1,
    "febrero" = 2,
    "marzo" = 3,
    "abril" = 4,
    "mayo" = 5,
    "junio" = 6,
    "julio" = 7,
    "agosto" = 8,
    "septiembre" = 9,
    "octubre" = 10,
    "noviembre" = 11,
    "diciembre" = 12
  )
  
  # Aquí se asume que merge_month carga los datos del mes específico
  month_data <- merge_month(month)
  
  # Suma los valores en la data consolidada
  result1 <- month_data[, lapply(.SD, function(x) sum(x, na.rm = TRUE)), .SDcols = c(...), by = by_col]
  
  # Suma los valores en la data específica del mes
  result2 <- data[MES == months_dictionary[[month]], lapply(.SD, function(x) sum(x, na.rm = TRUE)), .SDcols = c(...), by = by_col] 
  
  # Compara los resultados para verificar si coinciden
  if (all(result1 == result2)) {
    print("El contenido coincide")
  } else {
    print("El contenido no coincide")
  }
}

validation (data, "marzo", "DPTO", c("OCI", "P7360", "P9460"))
