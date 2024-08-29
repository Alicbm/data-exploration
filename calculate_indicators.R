#DESCOMENTAR EN CASO DE QUE NO TENGAS INSTALADAS LAS LIBRERIAS
#install.packages("data.table")
#install.packages("ggplot2")
#install.packages("dplyr")

library(data.table)
library(ggplot2)
library(dplyr)


#LEER EL ARCHIVO DE LA GEIH
#NOTA: Este archivo solo estará disponible si ejecuto las funciones "merge_month" y "geih_completed"
#     las cuales se encuentran e el archivo join_geih.R

data_geih <- fread(file = "C:/data-exploration/geih_complete.csv")

#REEMPLAZAR CODIGO DE LOS DEPARTAMENTOS POR SU NOMBRE RESPECTIVO
data_geih[, DPTO := fcase(
  DPTO == "5", "Antioquia",
  DPTO == "8", "Atlántico",
  DPTO == "11", "Bogotá D.C.",
  DPTO == "13", "Bolívar",
  DPTO == "15", "Boyacá",
  DPTO == "17", "Caldas",
  DPTO == "18", "Caquetá",
  DPTO == "19", "Cauca",
  DPTO == "20", "Cesar",
  DPTO == "23", "Córdoba",
  DPTO == "25", "Cundinamarca",
  DPTO == "27", "Chocó",
  DPTO == "41", "Huila",
  DPTO == "44", "La Guajira",
  DPTO == "47", "Magdalena",
  DPTO == "50", "Meta",
  DPTO == "52", "Nariño",
  DPTO == "54", "Norte de Santander",
  DPTO == "63", "Quindío",
  DPTO == "66", "Risaralda",
  DPTO == "68", "Santander",
  DPTO == "70", "Sucre",
  DPTO == "73", "Tolima",
  DPTO == "76", "Valle del Cauca",
  DPTO == "81", "Arauca",
  DPTO == "85", "Casanare",
  DPTO == "86", "Putumayo",
  DPTO == "88", "San Andrés y Providencia",
  DPTO == "91", "Amazonas",
  DPTO == "94", "Guainía",
  DPTO == "95", "Guaviare",
  DPTO == "97", "Vaupés",
  DPTO == "99", "Vichada",
  default = NA_character_
)]

#SI DESEAS DESCARGAR LA GEIH CON LA MODIFICACION ANTERIOR 
#(REEMPLAZO DE CODIGOS DE DEPARTAMENTOS POR SUS NOMBRES RESPECTIVOS) DESCOMENTA LA SIGUIENT LINEA
#fwrite(data_geih, file = "geih_modify.csv")


#Esta función retornará un dataframe con:
# - el factor de expansión, 
# - la tasa de desempleo, 
# - la tasa de ocupación, 
# - el número de ocupados
# - el número de desocupados
#A nivel departaemntal

group_variables <- function() {
  
  base_dir <- file.path(getwd(), "datos")
  
  months <- list.dirs(path = base_dir, full.names = FALSE, recursive = FALSE)
  
  factor_expansion <- data_geih[MES == length(months), .(factor_expansion = sum(FEX_C18)), by = DPTO]
  
  ocupados <- data_geih[, .(ocupados = sum(OCI * FEX_C18, na.rm = TRUE) / length(months)), by = DPTO]
  
  desocupados <- data_geih[, .(desocupados = sum(DSI * FEX_C18, na.rm = TRUE) / length(months)), by = DPTO]
  
  poblacion_edad_trabajar <- data_geih[P6040 >= 15, 
                                       .(poblacion_edad_trabajar = sum(FEX_C18, na.rm = TRUE) / length(unique(MES))), by = DPTO]
  
  combined <- factor_expansion[ocupados, on = "DPTO"][desocupados, on = "DPTO"][poblacion_edad_trabajar, on = "DPTO"]
  
  combined[, fuerza_trabajo := (ocupados + desocupados) ] #POBLACIÓN ACTIVA
  combined[, tasa_desempleo := (desocupados / fuerza_trabajo) * 100] #TASA DE DESEMPLEO
  combined[, tasa_ocupacion := (ocupados / poblacion_edad_trabajar) * 100] #TASA DE OCUPACIÓN
  
  return (combined)
}

table_variables_to_graph <- group_variables()


#FUNCIÓN PARA GRAFICAR TASAS
graph_variables <- function(df, variable, title_graph, title_y) {
  
  new_df <- data.table()
  new_df[, `:=` (DPTO = df$DPTO, var = variable)]
  
  desc_data <- new_df %>% arrange(desc(var))
  
  colors <- ifelse(desc_data$DPTO == "Cesar" | desc_data$DPTO == "Magdalena", '#147582', '#123344')
  colors_filter <- setNames(colors, levels(factor(desc_data$DPTO, levels = reorder(desc_data$DPTO, -desc_data$var))))
  
  ggplot(desc_data, aes(x = reorder(DPTO, -var), y = var, fill = DPTO)) +
    geom_bar(stat = "identity", size = 0.6) +
    scale_fill_manual(values = colors_filter) +
    theme_minimal() +
    theme(
      axis.text.x = element_text(angle = 90, hjust = 1, size = 9),
      axis.text.y = element_text(size = 10),
      axis.title.x = element_text(size = 12),
      axis.title.y = element_text(size = 12),
      plot.title = element_text(size = 14, face = "bold", hjust = 0.5, margin = margin(b = 10, t = 10)),
      panel.grid.major.y = element_line(color = "#959595", linetype = "dashed"),
      panel.grid.minor.y = element_blank(),
      plot.background = element_rect(fill = "#fcfbfb", color = NA),
      legend.position = "none",
    ) +
    labs(
      title = title_graph,
      x = "Departamentos",
      y = title_y
    ) +
    geom_text(aes(
      label = sprintf("%.1f%%", var)), 
      vjust = 0.4, 
      hjust = ifelse(desc_data$var < 5, -0.2, 1.5),
      angle = 90, 
      size = 3, 
      color = ifelse(desc_data$var < 5, "#000000", "white")
    )
  
}

#GRAFICO DE LA TASA DE DESEMPLEO A NIVEL DEPARTAMENTAL
graph_variables(
  table_variables_to_graph, 
  table_variables_to_graph$tasa_desempleo, 
  "Tasa de Desempleo para los\nDepartamentos de Colombia en el año 2024",
  "Tasa de Desempleo"
)

#GRAFICO DE LA TASA DE OCUPACIÓN A NIVEL DEPARTAMENTAL
graph_variables(
  table_variables_to_graph, 
  table_variables_to_graph$tasa_ocupacion, 
  "Tasa de Ocupación para los\nDepartamentos de Colombia en el año 2024",
  "Tasa de Ocupación"
)


table_variables_to_graph[,sum(ocupados)] / table_variables_to_graph[,sum(poblacion_edad_trabajar)]



data_geih[, DPTO]



