library(data.table)

getwd()
merge_month <- function(month) {
  
  final_df <- data.table()
  
  variables_to_delete <- c("PERIODO.y", "MES.y", "PER.y", "REGIS.y", "AREA.y", "CLASE.y", "DPTO.y", "FT.y", "FFT.y")
  
  key_variables = c("DIRECTORIO", "SECUENCIA_P", "ORDEN","HOGAR", "FEX_C18")
  
  setwd(paste0("C:/Users/MERCADEO/Documents/proyecto_d/analitica/data-exploration/eda_geih/datos/", month))
  
  all_files <- list.files(pattern = "*.csv", ignore.case = TRUE)
  
  for (files in all_files){
    
    if (length(final_df) == 0) {
      final_df <- fread(file = files)
    } else {
      
      df <- fread(file = files)
      col_names <- colnames(df)
      
      new_key_variables <- col_names[col_names %in% key_variables]
      
      final_df <- merge(final_df, df, by = c(new_key_variables), all.x = T)
      
      if ("PERIODO.x" %in% colnames(final_df)) {
        
        setnames(final_df, old = c("PERIODO.x", "MES.x", "PER.x", "REGIS.x", "AREA.x", "CLASE.x", "DPTO.x", "FT.x", "FFT.x"), new = c("PERIODO", "MES", "PER", "REGIS", "AREA", "CLASE", "DPTO", "FT", "FFT"))
        
        final_df[, c(variables_to_delete) := NULL]
      }
    }
    
    
  }
  
  return (final_df)
  
}



#####################################################

geih_completed <- function () {

  months <- c("enero", "febrero", "marzo", "abril", "mayo", "junio")
  
  all_months <- data.table()

  for (month in months) {
    
    if (length(all_months) == 0) {
      all_months <- merge_month(month)
    } else {
      all_months <- rbindlist(list(all_months, merge_month(month)), fill = T)
      
    }
    
  }
  
  return (all_months)
     
}

data <- geih_completed()

#####################################################


