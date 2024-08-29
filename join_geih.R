#Descomentar eliminando el (#) en caso de no tener instalada la libreria data.table
#install.packages("data.table")

library(data.table)

###################################################################
# FUNCIÓN PARA EL PEGADO DE TODOS LOS MODULOS DE UN MES ESPECIFICO 
##################################################################

merge_month <- function(month) {
  
  key_variables <- c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "FEX_C18")
  
  base_dir <- file.path(getwd(), "datos", month)
  
  all_files <- list.files(path = base_dir, pattern = "*.csv", full.names = TRUE, ignore.case = TRUE)
  
  # Leer el primer archivo para inicializar el data.table final
  final_df <- fread(file = all_files[1])
  
  # Iterar sobre los archivos restantes
  for (file in all_files[-1]) {
    df <- fread(file = file)
    
    # Encontrar las claves comunes para el merge
    new_key_variables <- intersect(colnames(df), key_variables)
    
    # Realizar el merge
    final_df <- merge(final_df, df, by = new_key_variables, all.x = TRUE)
    
    
    # Encontrar y renombrar columnas que terminan en .x
    cols_x <- grep("\\.x$", colnames(final_df), value = TRUE)
    setnames(final_df, old = cols_x, new = gsub("\\.x$", "", cols_x))
    
    
    # Encontrar y eliminar columnas que terminan en .y
    cols_y <- grep("\\.y$", colnames(final_df), value = TRUE)
    final_df[, (cols_y) := NULL]
    
  }
  
  return(final_df)
}




#############################################
# FUNCIÓN PARA EL PEGADO DE TODOS LOS MESES 
#############################################

geih_completed <- function () {

  base_dir <- file.path(getwd(), "datos")
  
  months <- list.dirs(path = base_dir, full.names = FALSE, recursive = FALSE)
  
  all_months <- data.table()

  for (month in months) {
    
    if (length(all_months) == 0) {
      all_months <- merge_month(month)
    } else {
      all_months <- rbindlist(list(all_months, merge_month(month)), fill = T)
    }
    
  }
  
  fwrite(all_months, file = "geih_complete.csv")
  return (all_months)
     
}

#Descomentar eliminando el (#) para iniciar con el pegado de las bases de datos

#geih_completed()

















