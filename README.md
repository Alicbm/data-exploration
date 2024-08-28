# Gran Encuesta Integrada de Hogares (GEIH) – Información Clave

## 1. ¿Qué es el DANE?

El Departamento Administrativo Nacional de Estadística (DANE) es la entidad oficial en Colombia encargada de la producción y difusión de estadísticas. Su misión es proporcionar información estadística confiable y oportuna para apoyar la toma de decisiones en áreas como demografía, economía, salud y educación.

## 2. ¿Qué es la GEIH?

La Gran Encuesta Integrada de Hogares (GEIH) es una encuesta continua realizada por el DANE que ofrece información detallada sobre el mercado laboral, los ingresos y las condiciones de vida de los hogares en Colombia. Recoge datos sobre empleo, desempleo, subempleo, ingresos, educación y características sociodemográficas.

## 3. ¿Para qué sirve y por qué importa?

- **Formulación de Políticas Públicas:** Facilita el desarrollo y ajuste de políticas en áreas como empleo y bienestar social, basándose en datos concretos.
- **Investigación y Análisis:** Permite a los investigadores estudiar fenómenos económicos y sociales, y analizar tendencias a lo largo del tiempo.
- **Toma de Decisiones Empresariales:** Ayuda a las empresas a comprender el mercado laboral y desarrollar estrategias basadas en datos.
- **Transparencia y Rendición de Cuentas:** Proporciona datos abiertos al público, promoviendo la transparencia y permitiendo el acceso a información relevante.

## 4. Cobertura de la GEIH

- **Cobertura Nacional:** La GEIH cubre todo el territorio colombiano, incluyendo zonas urbanas y rurales.
- **Áreas Específicas:** Puede excluir algunas áreas específicas como ciertas cabeceras municipales de la Amazonia y la Orinoquía debido a razones logísticas.
- **Temáticas Cubiertas:** Empleo, desempleo, ingresos, condiciones de vida, educación y características de los hogares.

## 5. Variables Claves para Unificar Datos Mensuales

Para unificar datos mensuales de la Gran Encuesta Integrada de Hogares (GEIH), es crucial contar con ciertas variables clave que aseguran una correcta integración y comparación de la información entre diferentes meses. A continuación, se detalla la importancia de cada una de estas variables:

- **DIRECTORIO:**
  - **Descripción:** Es un identificador único del directorio de la encuesta, que suele representar una unidad de vivienda o un bloque de viviendas.
  - **Importancia:** Garantiza que los datos se asocien al lugar correcto, permitiendo el seguimiento de las viviendas a lo largo del tiempo, y es fundamental para la identificación de cada unidad de análisis.

- **SECUENCIA_P:**
  - **Descripción:** Esta variable indica la secuencia de las personas dentro del hogar encuestado.
  - **Importancia:** Ayuda a diferenciar entre las distintas personas que habitan un mismo hogar. Es esencial para asegurar que cada registro corresponde a un individuo específico, evitando duplicaciones o confusiones.

- **ORDEN:**
  - **Descripción:** Es un identificador único que se asigna a cada persona dentro del hogar.
  - **Importancia:** Facilita el seguimiento de las características y respuestas de cada individuo en particular a través de diferentes periodos. Es clave para la individualización precisa en el análisis de datos longitudinales.

- **HOGAR:**
  - **Descripción:** Identificador único que diferencia a cada hogar dentro del directorio.
  - **Importancia:** Permite distinguir y relacionar las características de cada hogar, lo cual es esencial al agregar datos a nivel de hogar y al cruzar información demográfica y socioeconómica.

- **FEX_C18:**
  - **Descripción:** Factor de expansión calculado para ajustar los resultados de la encuesta a la población total del país.
  - **Importancia:** Es vital para realizar estimaciones representativas de la población. Utilizar el factor de expansión asegura que los análisis sean generalizables y reflejen con precisión las características de la población total.

## 6. Factor de Expansión

### 1. Definición y Propósito

El factor de expansión es un coeficiente utilizado para ajustar los resultados de una muestra estadística a la población total. Permite extrapolar los datos de una muestra representativa a la población general, en otras palabras, nos indica a cuántas personas está representando cada uno de los encuestados.

### 2. Cálculo del Factor de Expansión

El factor de expansión se calcula considerando:

- **Tamaño de la Muestra:** Número de hogares y personas encuestadas.
- **Distribución Poblacional:** Estructura demográfica y geográfica de la población total.
- **Pesos de Muestra:** Ajustes para corregir sesgos en la selección de la muestra.

En la GEIH, el cálculo incluye:

- **Determinación de la Muestra:** Selección de una muestra representativa basada en un diseño probabilístico.
- **Cálculo de Pesos:** Pesos para cada unidad de observación (hogares y personas) para reflejar su proporción en la población total.
- **Ajustes Regionales:** Corrección para que las estimaciones reflejen la estructura regional y demográfica.

### 3. Aplicación del Factor de Expansión

Para aplicar el factor de expansión:

- **Identificación del Factor de Expansión:** Busca la variable que representa el factor de expansión en los microdatos, como FEX_C18.
- **Uso en Cálculos:** Multiplica cada observación por su factor de expansión para ajustar a la población total. Ejemplo:

  plaintext
  Estimación Total = ∑ (Valor de la Observación × Factor de Expansión)

Si calculas el total de personas ocupadas, multiplica el estado de ocupación (1 si está ocupado, 0 si no) por el factor de expansión y suma los valores ajustados.

### 4. Consideraciones Adicionales

-   **Ajustes de Diseño Muestral:** Incluye ajustes para el diseño muestral como estratificación y muestreo por conglomerados.
-   **Validación de Datos:** Verifica que los factores de expansión se apliquen correctamente y que los datos ajustados reflejen la población.

## 7. Cómo Descargar Datos del DANE

### Guía Paso a Paso para Buscar Variables en la GEIH del DANE

#### 1. Ir al Sitio Web de DANE

>Abre tu navegador web y ve a la página principal del [DANE](https://www.dane.gov.co/ "DANE") Colombia.


![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/dane_intro.png?raw=true)



#### 2. Navegar a la sección de **Estadísticas por Tema**

>Haz clic en **"Mercado laboral"**


![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/2.estadistica_por_tema.png?raw=true)


>Después haz clic en** "Accesos directos"**, luego en **"Datos abiertos: microdatos y metadatos"**.


![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/3.acceseo_directo.png?raw=true)


>Después de lo anterior, ve a la sección de **"Mercado laboral"**


![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/4.mercado_laboral.png?raw=true)


>Luego busca la **"Gran Encuesta Integrada de Hogares (GEIH)"** , puedes utilizar la sección de filtros o el buscador (para este ejemplo tomamos la del 2024).


![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/5.geih.png?raw=true)


#### 3. Acceder a Microdatos
>En la página de la GEIH, busca una opción que diga **"Microdatos"**

>Haz clic en ella para acceder a la sección donde puedes descargar los datos detallados de la encuesta.


![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/6.microdatos.png?raw=true)

Una vez ahí podrás seleccionar el mes que desees utilizar, estos datos se desacrgaran en un archivo .zip, el ofrece datos en diferentes formatos, como lo son `.csv, .sav y .dta`, por temas de practicidad en este ejercicio utilizaremos el de tipo` .CSV`.

En estos datos descargados tendremos una serie de modulos disponibles, como lo son los siguentes:
- Caracteristicas generales, seguridad social en salud y educacion
- Ocupados
- Fuerza de trabajo
- No ocupados
- Otras formas de trabajo
- Migración
- Datos del hogar y la vivienda
- Otros ingresos e impuestos

>**Nota**: Dependiendo el año que descarguemos de la GEIH podemos tener ciertas variaciones en los modulos disponibles.


![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/7.un_mes.png?raw=true)


#### 4. Buscar Variables Específicas

En esta misa sección se encuentra el **Diccionario de Datos**, en ella se detallan los diferentes módulos disponibles en nuestra base de datos. Para cada módulo, se proporciona una lista de las variables incluidas, junto con un código y una descripción para cada una. Esto permite identificar claramente qué representa cada variable.

El [DANE](https://dane.gov.co/ "DANE") utiliza códigos en lugar de nombres extensos para las variables, ya que las preguntas a las que responden pueden ser muy detalladas. Estos códigos simplifican la representación de la información en la base de datos.

En el Diccionario de Datos, encontrarás una explicación de cada código para todos los módulos, incluyendo el de Ocupados, No Ocupados, y otros módulos previamente mencionados. Esta sección es fundamental para entender el significado de cada código y facilitar la interpretación de los datos.

![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/8.diccionario_datos.png?raw=true)



#### 5. Filtrar y Seleccionar Variables

Utiliza el **Diccionario de Datos** para identificar las variables de interés en tu análisis. Puedes buscar por temas específicos, como empleo, ingresos, educación, entre otros.

Al filtrar las variables, toma nota de los nombres y códigos asignados a cada una para su integración en tu software de análisis. Cada variable en el diccionario incluye una breve descripción de su contenido y una lista de las posibles respuestas o valores que puede tomar.

Este proceso te permitirá trabajar de manera más efectiva con los datos al tener una comprensión clara de cada variable y sus opciones de respuesta.

![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/10.opciones_respuesta.png?raw=true)


##Prepara el Entorno Para el Desarrollo

###1. Tener R y RStudio instalado:
En esta guía, utilizamos **R** como lenguaje de programación base y **RStudio** como nuestro editor de código. Por lo tanto, es necesario tener ambas herramientas instaladas en tu dispositivo.

Si aún no las tienes, sigue el siguiente enlace y aprende como instalarlos en menos de dos minutos [Clic aquí.](https://www.youtube.com/watch?v=hbgzW3Cvda4 "Clic aquí.")

###2. Crear un proyecto:

Para desarrollar de manera optima todo el proyecto es recomendable crear un nuevo proyecto, puedes hacerlo con los siguientes pasos:

1. Ve a la vista superior izquierda  y presiona **File** o **Archivo** (dependiendo el idioma en el cual está tu RStudio) y selecciona **New Porject...** o **Nuevo Proyecto...*

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/11.nuevo_proyecto.png?raw=true)

2. Crea un nuevo proyecto seleccionando **New Directory** o **Nuevo Directorio**

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/12.nuevo_directorio.png?raw=true)

3. Seleccionando **New Proyect** o **Nuevo Proyecto**

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/13.nuevo_proyecto.png?raw=true)

4. Crea una nueva carpeta, en el input **Directory Name** asigna el nombre que desees, en este caso será **data-exploration**.
>**Nota:** Puedes elegir la ruta donde prefieras guardar el proyecto, en este caso será en la carpeta raíz de nuestro computador, en tu caso puedes dejarla por defecto o escoger la que prefieras.

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/14.crear_carpeta.png?raw=true)

5. Luego de crear el proyecto RStudio lo redireccionará al proyecto creado, estando en este cree un archivo llamado join_geih.R

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/15.crear_archivo.png?raw=true)

6. Crea una carpeta llamada **datos** en la ruta raíz del proyecto (es necesario que se llame datos)

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/16.crear_carpeta.png?raw=true)


##Pasos para Organizar los Datos Descargados
**1. Descargar y Descomprimir los Datos:**
	Primero, descarga los datos de la fuente correspondiente. Una vez descargados, descomprime los archivos. Este paso 		generalmente implica extraer un archivo .zip o .rar que contiene todos los datos que necesitas.

**2. Crear Carpetas para Cada Mes:**
Dentro de la carpeta "datos"  (creada en la raíz del proyecto), crea una subcarpeta para cada uno de los meses de los cuales has descargado los datos. Por ejemplo:

>datos/enero

>datos/febrero

>datos/marzo

Y así sucesivamente para cada mes que corresponda a los datos que has descargado.

**3. Organizar los Módulos Dentro de Cada Carpeta de Mes:**

Dentro de cada carpeta de mes, coloca los 8 módulos correspondientes a ese mes. Cada módulo debe estar en formato .CSV. La estructura final debería verse así:

```markdown
datos/
├── enero/
│   ├── Características generales, seguridad social y educación.CSV
│   ├── Datos del hogar y la vivienda.CSV
│   ├── Fuerza de trabajo.CSV
│   ├── Migración.CSV
│   ├── No ocupados.CSV
│   ├── Ocupados.CSV
│   ├── Otras formas de trabajo.CSV
│   └── Otros ingresos e impuestos.CSV
├── febrero/
│   ├── Características generales, seguridad social y educación.CSV
│   ├── Datos del hogar y la vivienda.CSV
│   ├── Fuerza de trabajo.CSV
│   ├── Migración.CSV
│   ├── No ocupados.CSV
│   ├── Ocupados.CSV
│   ├── Otras formas de trabajo.CSV
│   └── Otros ingresos e impuestos.CSV
└── marzo/
    ├── Características generales, seguridad social y educación.CSV
    ├── Datos del hogar y la vivienda.CSV
    ├── Fuerza de trabajo.CSV
    ├── Migración.CSV
    ├── No ocupados.CSV
    ├── Ocupados.CSV
    ├── Otras formas de trabajo.CSV
    └── Otros ingresos e impuestos.CSV
```

##Funciones para el Pegado de Datos de la GEIH

Este documento proporciona las funciones en R necesarias para combinar los datos de la Gran Encuesta Integrada de Hogares (GEIH) por mes y por año.

## merge_month

Función para el pegado de todos los módulos de un mes específico, La función merge_month combina todos los archivos CSV de un mes específico en un solo data frame.

	
	library(data.table)
	
	merge_month <- function(month) {
      
      variables_to_delete <- c("PERIODO", "MES", "PER", "REGIS", "AREA", "CLASE", "DPTO")
      key_variables <- c("DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "FEX_C18")
      
      base_dir <- file.path(getwd(), "datos", month)
      
      all_files <- list.files(path = base_dir, pattern = "*.csv", full.names = TRUE, ignore.case = TRUE)
      
      final_df <- fread(file = all_files[1])
      
      for (file in all_files[-1]) {
      
       df <- fread(file = file)
        new_key_variables <- intersect(colnames(df),  key_variables)
        
        final_df <- merge(final_df, df, by = new_key_variables, all.x = TRUE)
        
        if ("PERIODO.x" %in% colnames(final_df)) {
          setnames(final_df, old = paste0(variables_to_delete, ".x"), new = gsub("\\.x$", "", variables_to_delete))
          final_df[, c(paste0(variables_to_delete, ".y")) := NULL]
        }
      }
      
      return(final_df)
    }

##geih_completed

Función para el pegado de todos los meses, La función geih_completed utiliza merge_month para combinar los datos de todos los meses en un solo archivo CSV.

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
	# geih_completed()
	



[Documentación de funciones   `merge_month` y `geih_completed` ](https://github.com/usuario/ejemplo-geih) "Documentación de funciones   `merge_month` y `geih_completed` ")



# Validación de Datos GEIH

Este documento proporciona las funciones en R necesarias para validar los datos de la Gran Encuesta Integrada de Hogares (GEIH). Estas funciones verifican la consistencia de los datos consolidados (ten en cuenta que en este ejercicio solo hemos unido los datos de 6 meses, ya que son los únicos datos recolectados por el DANE en lo que va del año), el conteo de registros, la presencia de duplicados, la completitud de datos y la validación de contenidos específicos.

    #Lectura de Datos Consolidados
	
    data <- fread(file = "C:/data-exploration/geih_complete.csv")
    getwd()
	

##1. Verificar la Estructura de los Datos
####Columnas Comunes
Este paso verifica si los nombres de las columnas en los datos de cada mes son iguales a los de la data consolidada. Se toma cada mes de datos para asegurar que la estructura de columnas es consistente.

    base_dir <- file.path(getwd(), "datos")
    months <- list.dirs(path = base_dir, full.names = FALSE, recursive = FALSE)
    
    Verify_variables <- function() {
      for (month in months) {
        month_data <- merge_month(month)
        if (all(names(month_data) %in% names(data))) {
          print(paste("Las variables son las mismas que las del mes de", month))
        } else {
          print(paste("Las variables no son las mismas que las del mes de", month))
        }
      }
    }
    
    Verify_variables()


## 2. Conteo de Registros

Este paso suma el número de observaciones de cada mes para asegurarse de que coincida con el número total de observaciones en la data consolidada.

    observaciones <- function() {
      total_obs <- 0
      for (month in months) {
        month_data <- merge_month(month)
        total_obs <- total_obs + nrow(month_data)
      }
      if (total_obs == nrow(data)) {
        print("El número de observaciones es correcto")
      } else {
        print("El número de observaciones no es correcto")
      }
    }
    
    observaciones()

## 3. Verificar Duplicados

Identifica si hay filas duplicadas en la data consolidada.

    duplicate <- function(data) {
      duplicate <- data[duplicated(data)]
      if (nrow(duplicate) == 0) {
        print("No hay duplicados por fila")
      } else {
        print("Hay duplicados por fila")
      }
    }
    
    duplicate(data)
	

##4. Completitud de Datos
Este paso cuenta los valores faltantes en columnas clave para asegurarse de que no haya datos faltantes.

    missing_values <- function(data, ...) {
      data[, lapply(.SD, function(x) sum(is.na(x))), .SDcols = c(...)]
    }
    
    # Contamos valores faltantes en las columnas especificadas
    missing_values(data, "DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "FEX_C18")
	

##5. Validación de Contenidos
Compara la cantidad de ocupados en un mes específico por departamento entre la data consolidada y la data específica de ese mes.

    validation <- function(data, month, by_col, ...) {
      months_dictionary <- list(
        "enero" = 1, "febrero" = 2, "marzo" = 3, "abril" = 4,
        "mayo" = 5, "junio" = 6, "julio" = 7, "agosto" = 8,
        "septiembre" = 9, "octubre" = 10, "noviembre" = 11, "diciembre" = 12
      )
      month_data <- merge_month(month)
      result1 <- month_data[, lapply(.SD, function(x) sum(x, na.rm = TRUE)), .SDcols = c(...), by = by_col]
      result2 <- data[MES == months_dictionary[[month]], lapply(.SD, function(x) sum(x, na.rm = TRUE)), .SDcols = c(...), by = by_col]
      if (all(result1 == result2)) {
        print("El contenido coincide")
      } else {
        print("El contenido no coincide")
      }
    }
    
    validation(data, "marzo", "DPTO", c("OCI", "P7360", "P9460"))
	

[Documentación de funciones   `merge_month` y `geih_completed` ](https://github.com/usuario/ejemplo-geih) "Documentación de funciones   `merge_month` y `geih_completed` 

 