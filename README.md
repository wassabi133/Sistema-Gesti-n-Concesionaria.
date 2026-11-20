# Sistema-Gesti-n-Concesionaria.
Sistema de administración y venta de vehículos desarrollado como proyecto académico.

# Sistema de Administración de Concesionaria (La Plata) 

Sistema de gestión de inventario, cálculo de seguros y análisis estadístico de vehículos desarrollado en Dolphin Smalltalk.

#  Objetivo del Proyecto
Digitalizar la administración de unidades disponibles para la venta de una concesionaria, aplicando los pilares de la Programación Orientada a Objetos (POO): herencia, polimorfismo, encapsulamiento y manejo de colecciones y diccionarios en memoria.

#  Arquitectura y Clases
El sistema modela la lógica de negocio a través de una jerarquía de clases bien definida:

*`Concesionaria` (`ConcesionariaN.cls`): Clase gestora principal. Administra el stock respetando la capacidad máxima de exposición, registra sucursal, ciudad y porcentaje de comisión, y ejecuta las consultas, filtros y estadísticas.
*`Vehiculo` (`VehiculoN.cls`): Superclase abstracta/general que agrupa los atributos compartidos: patente única, marca, modelo, año de fabricación, precio, kilometraje y estado (*Disponible*, *Reservado* o *Vendido*).
*`Auto` (`AutoN.cls`): Subclase de `Vehiculo` que incorpora cantidad de puertas y capacidad de baúl. Implementa polimórficamente el cálculo de seguro (3% del precio base + 1% adicional para modelos anteriores a 2015).
*`Moto` (`MotoN.cls`): Subclase de `Vehiculo` que registra cilindrada y sistema ABS. Implementa su propia lógica de seguro (2% del precio base + 1% adicional si supera los 300 cc).

# Funcionalidades Principales
*Gestión de Stock (ABM): Alta de unidades con control de límite de capacidad, búsqueda individual por patente, modificación de datos y baja del inventario.
*Listados y Filtros Dinámicos: Generación de reportes de vehículos fabricados antes de 2015, unidades con menos de 30.000 km y filtrado personalizado por marca.
*Análisis Estadístico y Seguros: Cálculo de precio promedio de unidades disponibles, detección de vehículos que superan 1.5x el promedio, búsqueda de la unidad más económica y sumatoria total de costos de seguro estimados.
*Depuración y Agrupamiento:** Eliminación masiva de unidades en estado *Vendido* y generación de un Diccionario (`Dictionary') con el conteo de unidades disponibles agrupadas por marca.

#  Contenido del Repositorio
* **`trabajoFinal.st`:** Paquete completo listo para importar en el entorno Dolphin Smalltalk.
* **Archivos `.cls`:** Definiciones individuales de cada clase para facilitar la inspección rápida del código fuente.

# Cómo ejecutarlo
1. Abrir **Dolphin Smalltalk**.
2. Importar el archivo `trabajoFinal.st` desde el *Package Browser*(open workspace: para ver el código interno vía el workspace | file in: iniciar y interactuar con el programa).
3. Abrir un *Workspace*, instanciar una `Concesionaria`, cargar vehículos y probar los métodos de consulta y estadística.
