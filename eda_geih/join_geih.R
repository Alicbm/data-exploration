library(data.table)


merge_month <- function(month) {
  
  final_df <- data.table()
  
  key_variables = c("DIRECTORIO", "SECUENCIA_P", "ORDEN","HOGAR", "FEX_C18", "PERIODO", "MES", "PER", "REGIS", "AREA", "DPTO", "CLASE")
  
  setwd(paste0("C:/data_exploration/data-exploration/eda_geih/datos/", month))
  
  all_files <- list.files(pattern = "*.csv", ignore.case = TRUE)
  
  for (files in all_files){
    
    if (length(final_df) == 0) {
      final_df <- fread(file = files)
    }
    
    df <- fread(file = files)
    col_names <- colnames(df)
    
    new_key_variables <- col_names[col_names %in% key_variables]
    
    final_df <- merge(final_df, df, by = c(new_key_variables), all.x = T, no.dups = TRUE)
  }
  
  return (final_df)
  
}






