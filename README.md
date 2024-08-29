## Índice

1. [¿Qué es el DANE?](#1-qué-es-el-dane)
2. [¿Qué es la GEIH?](#2-qué-es-la-geih)
3. [¿Para qué sirve y por qué importa?](#3-para-qué-sirve-y-por-qué-importa)
4. [Cobertura de la GEIH](#4-cobertura-de-la-geih)
5. [Variables Claves para Unificar Datos Mensuales](#5-variables-claves-para-unificar-datos-mensuales)
6. [Factor de Expansión](#6-factor-de-expansión)
   - [Definición y Propósito](#1-definición-y-propósito)
   - [Cálculo del Factor de Expansión](#2-cálculo-del-factor-de-expansión)
   - [Aplicación del Factor de Expansión](#3-aplicación-del-factor-de-expansión)
   - [Consideraciones Adicionales](#4-consideraciones-adicionales)
7. [Guía Paso a Paso para Buscar Variables en la GEIH del DANE](#7-guía-paso-a-paso-para-buscar-variables-en-la-geih-del-dane)
   - [Ir al Sitio Web de DANE](#1-ir-al-sitio-web-de-dane)
   - [Navegar a la sección de Estadísticas por Tema](#2-navegar-a-la-sección-de-estadísticas-por-tema)
   - [Acceder a Microdatos](#3-acceder-a-microdatos)
   - [Buscar Variables Específicas](#4-buscar-variables-específicas)
   - [Filtrar y Seleccionar Variables](#5-filtrar-y-seleccionar-variables)
8. [Prepara el Entorno Para el Desarrollo](#8-prepara-el-entorno-para-el-desarrollo)
   - [Tener R y RStudio Instalado](#1-tener-r-y-rstudio-instalado)
   - [Crear un Proyecto](#2-crear-un-proyecto)
9. [Pasos para Organizar los Datos Descargados](#9-pasos-para-organizar-los-datos-descargados)
   -  [Descargar y Descomprimir los Datos](#1-descargar-y-descomprimir-los-datos)
   -  [Crear Carpetas para Cada Mes](#2-crear-carpetas-para-cada-mes)
   -  [Organizar los Módulos Dentro de Cada Carpeta de Mes](#3-organizar-los-módulos-dentro-de-cada-carpeta-de-mes)
10. [Funciones para el Pegado de Datos de la GEIH](#10-funciones-para-el-pegado-de-datos-de-la-geih)
    - [Función para el pegado de todos los módulos en un mes determinado](#1-función-para-el-pegado-de-todos-los-módulos-en-un-mes-determinado)
    - [Función para el pegado de todos los meses](#2-función-para-el-pegado-de-todos-los-meses)
11. [Validación de Datos GEIH](#11-validación-de-datos-geih)
    - [Verificar la Estructura de los Datos](#1-verificar-la-estructura-de-los-datos)
    - [Conteo de Registros](#2-conteo-de-registros)
    - [Verificar Duplicados](#3-verificar-duplicados)
    - [Completitud de Datos](#4-completitud-de-datos)
    - [Verificación de Variables con Sufijos](#5-verificación-de-variables-con-sufijos)
    - [Validación de Contenidos](#6-validación-de-contenidos)
12. [Cálculo y Gráfico de Indicadores](#12-cálculo-y-gráfico-de-indicadores)
    - [Instalación de Librerias](#1-instalación-de-librerias)
    - [Lectura del Archivo GEIH](#2-lectura-del-archivo-geih)
    - [Reemplazo de Códigos de Departamentos por Nombres](#3-reemplazo-de-códigos-de-departamentos-por-nombres)
    - [Función Para el Cálculo de Indicadores](#4-función-para-el-cálculo-de-indicadores)
    - [Función Para Graficar Indicadores](#5-función-para-graficar-indicadores)
    - [Retorno de la Función](#6-retorno-de-la-función)
13. [Conclusión](#13-conclusión)


# Gran Encuesta Integrada de Hogares (GEIH) – Información Clave

>**Nota:** Estas funciones están diseñadas para utilizarse con la GEIH de 2022 y posteriores. Si deseas emplearlas con bases de datos de la GEIH anteriores, es necesario realizar algunas modificaciones en las distintas funciones. Puedes adaptarlas según tus necesidades. Sin embargo, si utilizas la GEIH de 2022 o posteriores, puedes trabajar con estas funciones paso a paso.

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

 `Estimación Total = ∑ (Valor de la Observación × Factor de Expansión)`

Si calculas el total de personas ocupadas, multiplica el estado de ocupación (1 si está ocupado, 0 si no) por el factor de expansión y suma los valores ajustados.

### 4. Consideraciones Adicionales

-   **Ajustes de Diseño Muestral:** Incluye ajustes para el diseño muestral como estratificación y muestreo por conglomerados.
-   **Validación de Datos:** Verifica que los factores de expansión se apliquen correctamente y que los datos ajustados reflejen la población.

## 7. Guía Paso a Paso para Buscar Variables en la GEIH del DANE

#### 1. Ir al Sitio Web de DANE

>Abre tu navegador web y ve a la página principal del [DANE](https://www.dane.gov.co/ "DANE") Colombia.


![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/1.dane_intro.png?raw=true)



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


## 8. Prepara el Entorno Para el Desarrollo

### 1. Tener R y RStudio instalado:
En esta guía, utilizamos **R** como lenguaje de programación base y **RStudio** como nuestro editor de código. Por lo tanto, es necesario tener ambas herramientas instaladas en tu dispositivo.

Si aún no las tienes, sigue el siguiente enlace y aprende como instalarlos en menos de dos minutos [Clic aquí.](https://www.youtube.com/watch?v=hbgzW3Cvda4 "Clic aquí.")

### 2. Crear un proyecto:

Para desarrollar de manera optima todo el proyecto es recomendable crear un nuevo proyecto, puedes hacerlo con los siguientes pasos:

1. Ve a la vista superior izquierda  y presiona **File** o **Archivo** (dependiendo el idioma en el cual está tu RStudio) y selecciona **New Porject...** o **Nuevo Proyecto...**

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/11.nuevo_proyecto.png?raw=true)

2. Crea un nuevo proyecto seleccionando **New Directory** o **Nuevo Directorio**

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/12.nuevo_directorio.png?raw=true)

3. Seleccionando **New Proyect** o **Nuevo Proyecto**

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/13.nuevo_proyecto.png?raw=true)

4. Crea una nueva carpeta, en el input **Directory Name** asigna el nombre que desees, en este caso será **data-exploration**.
>**Nota:** Puedes elegir la ruta donde prefieras guardar el proyecto, en este caso será en la carpeta que tiene por defecto (Documentos: Representada por ~), en tu caso puedes dejarla por defecto o escoger la que prefieras.

   ![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/14.crear_carpeta.png?raw=true)

5. Luego de crear el proyecto RStudio lo redireccionará al proyecto creado, estando en este cree un archivo llamado join_geih.R

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/15.crear_archivo.png?raw=true)

6. Crea una carpeta llamada **datos** en la ruta raíz del proyecto (es necesario que se llame datos)

	![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/readme-images/16.crear_carpeta.png?raw=true)


## 9. Pasos para Organizar los Datos Descargados

### 1. Descargar y Descomprimir los Datos

Primero, descarga los datos de la fuente correspondiente. Una vez descargados, descomprime los archivos. Este paso 		generalmente implica extraer un archivo .zip o .rar que contiene todos los datos que necesitas.

### 2. Crear Carpetas para Cada Mes

Dentro de la carpeta "datos"  (creada en la raíz del proyecto), crea una subcarpeta para cada uno de los meses de los cuales has descargado los datos. Por ejemplo:

>datos/enero

>datos/febrero

>datos/marzo

Y así sucesivamente para cada mes que corresponda a los datos que has descargado.

### 3. Organizar los Módulos Dentro de Cada Carpeta de Mes

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

## 10. Funciones para el Pegado de Datos de la GEIH

Este documento proporciona las funciones en R necesarias para combinar los datos de la Gran Encuesta Integrada de Hogares (GEIH) por mes y por año.

>**Nota**: Para utilizar las siguientes funciones basta con que las copies y pregues en tu archivo **join_geih.R** anteriormente creado. 

### 1. Función para el pegado de todos los módulos en un mes determinado

#### Instalación de Librerias

    #Descomentar eliminando el (#) en caso de no tener instalada la libreria data.table
    #install.packages("data.table")
    
    library(data.table)

La función `merge_month` toma como entrada el nombre de un mes y realiza la fusión de múltiples archivos CSV en un directorio específico del mes. Primero, define las variables a eliminar y las variables clave para la fusión. Luego, lista todos los archivos CSV en el directorio del mes, lee el primer archivo y lo usa como base. En un bucle, lee cada archivo restante, fusiona sus datos con la base usando las variables clave comunes, y elimina columnas innecesarias que puedan haber sido duplicadas en la fusión. Finalmente, devuelve el data.table consolidado con la información combinada.

Para obtener información detallada de esta función te recomendamos seguir el siguiente link [Click aquí.](https://data-exploration.vercel.app/merge_geih_explication_functions.html#funci%C3%B3n-para-el-pegado-de-todos-los-modulos-en-un-mes-determinado-merge_month "Click aquí.")

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

    

### 2. Función para el pegado de todos los meses

La función geih_completed se encarga de consolidar los datos de todos los meses disponibles en el directorio datos en un único archivo `CSV`. Primero, define la ruta base y obtiene los nombres de los subdirectorios (que corresponden a los meses) en dicha ruta. Luego, inicializa un data.table vacío para almacenar los datos combinados. En un bucle, para cada mes, llama a la función `merge_month` para fusionar los archivos `CSV` del mes actual, y une estos datos con los datos acumulados anteriormente usando rbindlist. Finalmente, guarda el data.table completo en un archivo `CSV` llamado `geih_complete.csv`  y devuelve el data.table resultante.

Para obtener información detallada de esta función te recomendamos seguir el siguiente link [Click aquí.](https://data-exploration.vercel.app/merge_geih_explication_functions.html#funci%C3%B3n-para-el-pegado-de-todos-los-meses-geih_completed "Click aquí.")

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
    
    geih_completed()


## 11. Validación de Datos GEIH

Este documento proporciona las funciones en R necesarias para validar los datos de la Gran Encuesta Integrada de Hogares (GEIH). Estas funciones verifican la consistencia de los datos consolidados (ten en cuenta que en este ejercicio solo hemos unido los datos de 6 meses, ya que son los únicos datos recolectados por el DANE en lo que va del año), el conteo de registros, la presencia de duplicados, la completitud de datos y la validación de contenidos específicos.

>**Nota:** En este caso cargamos la base de datos en la variable `data` desde la ruta `C:/data-exploration/geih_complete.csv` debido a que es la ruta donde se descargo anteriormente la base de datos de la geih (la cual obtuvimos en la función [geih_completed](#1-función-para-el-pegado-de-todos-los-módulos-en-un-mes-determinado))

    data <- fread(file = "C:/data-exploration/geih_complete.csv")

### 1. Verificar la Estructura de los Datos
La función `verify_variables` se utiliza para garantizar la consistencia en la estructura de los datos a lo largo del tiempo. Itera a través de los datos de cada mes, verifica si las columnas en los datos de cada mes coinciden con las de un conjunto de datos consolidado, y proporciona retroalimentación sobre cualquier discrepancia encontrada. Esto es crucial para asegurar que el análisis posterior sea consistente y preciso, evitando errores debido a diferencias en la estructura de los datos.

Para obtener información detallada de esta función te recomendamos seguir el siguiente link [Click aquí.](https://data-exploration.vercel.app/data_validation.html#funci%C3%B3n-para-verificar-la-estructura-de-los-datos-verify_variables "Click aquí.")

    base_dir <- file.path(getwd(), "datos")
    months <- list.dirs(path = base_dir, full.names = FALSE, recursive = FALSE)
    
    verify_variables <- function() {
      for (month in months) {
        month_data <- merge_month(month)
        if (all(names(month_data) %in% names(data))) {
          print(paste("Las variables son las mismas que las del mes de", month))
        } else {
          print(paste("Las variables no son las mismas que las del mes de", month))
        }
      }
    }
    
    verify_variables()


### 2. Conteo de Registros

La función `duplicate` se utiliza para verificar la existencia de filas duplicadas en un conjunto de datos específico. Primero, identifica todas las filas duplicadas y las almacena en un nuevo data frame. Luego, verifica si hay o no filas duplicadas al comprobar el número de filas en el data frame de duplicados. Dependiendo del resultado, se imprime un mensaje para informar al usuario si hay duplicados en las filas o si todas las filas son únicas. Detectar y manejar duplicados es crucial en análisis de datos para evitar sesgos y asegurar que los resultados reflejen con precisión la realidad del fenómeno estudiado.

Para obtener información detallada de esta función te recomendamos seguir el siguiente link [Click aquí.](https://data-exploration.vercel.app/data_validation.html#funci%C3%B3n-para-el-conteo-de-registros-observations "Click aquí.")

    observations <- function() {
    
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
     
    observations()

### 3. Verificar Duplicados

La función `duplicate` se utiliza para verificar la existencia de filas duplicadas en un conjunto de datos específico. Primero, identifica todas las filas duplicadas y las almacena en un nuevo data frame. Luego, verifica si hay o no filas duplicadas al comprobar el número de filas en el data frame de duplicados. Dependiendo del resultado, se imprime un mensaje para informar al usuario si hay duplicados en las filas o si todas las filas son únicas. Detectar y manejar duplicados es crucial en análisis de datos para evitar sesgos y asegurar que los resultados reflejen con precisión la realidad del fenómeno estudiado.

Para obtener información detallada de esta función te recomendamos seguir el siguiente link [Click aquí.](https://data-exploration.vercel.app/data_validation.html#funci%C3%B3n-para-verificar-duplicados-duplicate "Click aquí.")

    duplicate <- function(data) {
      duplicate <- data[duplicated(data)]
      if (nrow(duplicate) == 0) {
        print("No hay duplicados por fila")
      } else {
        print("Hay duplicados por fila")
      }
    }
    
    duplicate(data)
	

### 4. Completitud de Datos
La función `missing_values` se utiliza para evaluar la completitud de datos en un conjunto específico de columnas dentro de un data frame. Al contar el número de valores faltantes NA en cada columna especificada, esta función ayuda a identificar problemas de calidad de datos, como la presencia de registros incompletos. Tener columnas clave con valores faltantes puede afectar negativamente los análisis posteriores, por lo que esta función es útil para realizar una limpieza de datos inicial y asegurar que las columnas esenciales estén completas antes de proceder con análisis más detallados

Para obtener información detallada de esta función te recomendamos seguir el siguiente link [Click aquí.](https://data-exploration.vercel.app/data_validation.html#funci%C3%B3n-para-validar-la-completitud-de-los-datos-en-las-variables-clave-missing_values "Click aquí.")

    missing_values <- function(data, ...) {
      data[, lapply(.SD, function(x) sum(is.na(x))), .SDcols = c(...)]
    }
    
    # Contamos valores faltantes en las columnas especificadas
    missing_values(data, "DIRECTORIO", "SECUENCIA_P", "ORDEN", "HOGAR", "FEX_C18")
	

### 5. Verificación de Variables con Sufijos

La función `select_suffix()` permite seleccionar y mostrar columnas de un `data.table` que terminan en los sufijos especificados. Si no se encuentran columnas con los sufijos proporcionados, la función informa al usuario. Esto facilita la identificación y el análisis de columnas específicas en un conjunto de datos.

    select_suffix <- function(data, sufijos = "x") {
      
      regex_pattern <- paste0("\\.(", paste(sufijos, collapse = "|"), ")$")
      
      matching_cols <- grep(regex_pattern, names(data), value = TRUE)
      
      if (length(matching_cols) > 0) {
        result <- data[, ..matching_cols]
        print(result)
      } else {
        print(paste0("No hay variables que terminen en ", paste(sufijos, collapse = ", ")))
      }
    }
    
    select_suffix(data, c("x", "y", "z"))

### 6. Validación de Contenidos

La función `content_validation()` se utiliza para verificar la consistencia de los datos entre un conjunto de datos mensual específico y un conjunto de datos consolidado. Primero, obtiene los datos del mes especificado y calcula las sumas de ciertas columnas agrupadas por una columna clave. Luego, realiza el mismo cálculo en el conjunto de datos consolidado para el mes correspondiente y compara los resultados. Esta función es esencial para asegurar que los datos de los meses individuales coincidan con los datos en el conjunto consolidado, garantizando así la integridad y precisión de los datos en el análisis.

Para obtener información detallada de esta función te recomendamos seguir el siguiente link [Click aquí.](https://data-exploration.vercel.app/data_validation.html#funcion-para-la-validaci%C3%B3n-de-contenido-content_alidation "Click aquí.")

    content_validation <- function(data, month, by_col, ...) { 
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
    
      month_data <- merge_month(month) 
    
      total_complete_data <- month_data[, lapply(.SD, function(x) sum(x, na.rm = TRUE)), .SDcols = c(...), by = by_col] 
      total_month_data <- data[MES == months_dictionary[[month]], lapply(.SD, function(x) sum(x, na.rm = TRUE)), .SDcols = c(...), by = by_col]
      
      if (all(total_complete_data == total_month_data)) { 
        print("El contenido coincide") 
      } else { 
        print("El contenido no coincide") 
      } 
    } 
    
    content_validation(data, "marzo", "DPTO", c("OCI", "P7360", "P9460"))


## 12. Cálculo y Gráfico de Indicadores

### 1. Instalación de Librerias

    #DESCOMENTAR EN CASO DE QUE NO TENGAS INSTALADAS LAS LIBRERIAS
    #install.packages("data.table")
    #install.packages("ggplot2")
    #install.packages("dplyr")
    
    library(data.table)
    library(ggplot2)
    library(dplyr)

### 2. Lectura del Archivo GEIH

    #LEER EL ARCHIVO DE LA GEIH
    #NOTA: Este archivo solo estará disponible si ejecuto las funciones "merge_month" y "geih_completed" las cuales se encuentran en el archivo join_geih.R
    
    data_geih <- fread(file = "C:/data-exploration/geih_complete.csv")

### 3. Reemplazo de Códigos de Departamentos por Nombres

 Este bloque de código usa la función fcase() de data.table para reemplazar los códigos numéricos de los departamentos por sus nombres. Cada condición `por ejemplo, DPTO == "5"` se empareja con un valor ("Antioquia"), y así sucesivamente.

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


### Guardar el Archivo Modificado (opcional)

Esta línea te permite guardar la versión modificada del archivo `data_geih` en un nuevo `CSV` llamado `geih_modify.csv`. Si deseas hacerlo, solo necesitas descomentar la línea.

    #fwrite(data_geih, file = "geih_modify.csv")

### 4. Función Para el Cálculo de Indicadores

La función `group_variables` tiene como objetivo crear un dataframe que incluya variables e indicadores clave para la práctica. Entre los datos que se generarán se encuentran la población por departamento `factor_expansion`, el número de ocupados y desocupados, así como las tasas de desempleo y de ocupación para cada uno de los departamentos de Colombia.

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

### 5. Función Para Graficar Indicadores

La función `graph_variables` crea un gráfico de barras para visualizar tasas de desempleo u ocupación por departamento. Toma un `data.table`, el nombre de la variable a graficar, y los títulos del gráfico. Prepara y ordena los datos, asigna colores a los departamentos, y usa `ggplot2` para generar el gráfico. Ajusta el estilo del gráfico y añade etiquetas con los valores exactos en las barras. El resultado es un gráfico claro y visualmente atractivo que muestra las tasas por departamento.

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
          legend.position = "none"
        ) +
        labs(
          title = title_graph,
          x = "Departamentos",
          y = "Tasa de Desempleo"
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

### 6. Retorno de la Función

#### 1. Tasa de Desempleo

    graph_variables(
      table_variables_to_graph, 
      table_variables_to_graph$tasa_desempleo, 
      "Tasa de Desempleo para los\nDepartamentos de Colombia en el año 2024",
      "Tasa de Desempleo"
    )

#### Retorno de la Función

![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/images/tasa_desempleo.png?raw=true)

#### 2. Tasa de Ocupación

    graph_variables(
      table_variables_to_graph, 
      table_variables_to_graph$tasa_ocupacion, 
      "Tasa de Ocupación para los\nDepartamentos de Colombia en el año 2024",
      "Tasa de Ocupación"
    )

#### Retorno de la Función

![image](https://github.com/Alicbm/data-exploration/blob/testing-readme/images/tasa_ocupacion.png?raw=true)

## 13. Conclusión

Este proyecto nos ha permitido aplicar nuestros conocimientos en economía y analítica de datos para crear herramientas que facilitan el manejo y análisis de bases de datos complejas, como las del DANE. Las funciones desarrolladas mejoran la eficiencia y precisión en la unión de datos, la validación de información y el cálculo de indicadores del mercado laboral.

Esperamos que estas herramientas sirvan como un recurso valioso para futuros estudiantes y profesionales, promoviendo buenas prácticas en el análisis de datos y contribuyendo al avance del conocimiento en el campo de la economía laboral en Colombia.
