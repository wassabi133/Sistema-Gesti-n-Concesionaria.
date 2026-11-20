| concesionaria nombre sucursal ciudad capmax comision patente marca modelo anio precio kilometraje estado puertas capbaul auto cilindrada abs moto opcion subOpcion nuevoDato patenteBuscada vehiculoBuscado marcaBuscada listadoAntes2015 listadoMenor30mil listadoPorMarca disp sumaPromedio promedio limite autosCaros masBarato totalSeguros vendidos diccionarioMarcas col colMarcas sinRep seguir |

"====================================================================="
" 1. CREACIÓN DE LA CONCESIONARIA CON VALIDACIONES"
"====================================================================="
nombre := Prompter prompt: 'Ingrese nombre de la concesionaria: '.
[(nombre isNil) or: [nombre isEmpty]] whileTrue: [
	MessageBox notify: 'Error: Debe ingresar un nombre válido para la concesionaria.'.
	nombre := Prompter prompt: 'Ingrese nuevamente el nombre de la concesionaria: '.
].

sucursal := Prompter prompt: 'Ingrese la sucursal de la concesionaria: '.
[(sucursal isNil) or: [sucursal isEmpty]] whileTrue: [
	MessageBox notify: 'Error: Debe ingresar una sucursal válida.'.
	sucursal := Prompter prompt: 'Ingrese nuevamente la sucursal de la concesionaria: '.
].

ciudad := Prompter prompt: 'Ingrese la ciudad en la que se encuentra la concesionaria: '.
[(ciudad isNil) or: [ciudad isEmpty]] whileTrue: [
	MessageBox notify: 'Error: Debe ingresar una ciudad válida.'.
	ciudad := Prompter prompt: 'Ingrese nuevamente la ciudad de la concesionaria: '.
].

"Validación de capacidad máxima mayor a 0"
nuevoDato := Prompter prompt: 'Ingrese la capacidad máxima de vehículos de la concesionaria: '.
[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
	MessageBox notify: 'Error: La capacidad máxima debe ser un número mayor a 0.'.
	nuevoDato := Prompter prompt: 'Ingrese nuevamente la capacidad máxima de vehículos: '.
].
capmax := nuevoDato asNumber.

"Validación de comisión no negativa"
nuevoDato := Prompter prompt: 'Ingrese la comisión de venta que cobra la concesionaria: '.
[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber < 0]]] whileTrue: [
	MessageBox notify: 'Error: La comisión no puede ser vacía ni negativa.'.
	nuevoDato := Prompter prompt: 'Ingrese nuevamente la comisión de venta: '.
].
comision := nuevoDato asNumber.

concesionaria := Concesionaria crear: nombre con: sucursal con: ciudad con: capmax con: comision.

"====================================================================="
" 2. CARGA DE VEHÍCULOS A LA CONCESIONARIA (AUTOS Y MOTOS)"
"====================================================================="
[MessageBox confirm: '¿Desea ingresar un vehículo?'] whileTrue: [
	(concesionaria tamanio < concesionaria verCapmax) 
		ifTrue: [
			opcion := ChoicePrompter 
				choices: #('1-Ingresar Auto' '2-Ingresar Moto') 
				caption: 'Seleccione el tipo de vehículo a ingresar'.

			(opcion isNil) ifTrue: [
				MessageBox notify: 'Carga cancelada. No seleccionó ningún tipo de vehículo.'.
			] ifFalse: [
				"--- INGRESO DE AUTO ---"
				(opcion = '1-Ingresar Auto') ifTrue: [
					patente := Prompter prompt: 'Ingresar la patente del Auto: '.
					[(patente isNil) or: [patente isEmpty or: [((concesionaria verTodos) detect: [:unVehi | unVehi verPatente = patente] ifNone: [nil]) notNil]]] whileTrue: [
						MessageBox notify: 'Error: La patente no puede estar vacía ni repetirse con otro vehículo.'.
						patente := Prompter prompt: 'Ingresar una patente válida y diferente para el Auto: '.
					].

					marca := Prompter prompt: 'Ingresar la marca del Auto: '.
					[(marca isNil) or: [marca isEmpty]] whileTrue: [
						MessageBox notify: 'Error: Debe ingresar una marca válida.'.
						marca := Prompter prompt: 'Ingresar nuevamente la marca del Auto: '.
					].

					modelo := Prompter prompt: 'Ingresar el modelo del Auto: '.
					[(modelo isNil) or: [modelo isEmpty]] whileTrue: [
						MessageBox notify: 'Error: Debe ingresar un modelo válido.'.
						modelo := Prompter prompt: 'Ingresar nuevamente el modelo del Auto: '.
					].

					nuevoDato := Prompter prompt: 'Ingresar el anio del Auto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 1900]]] whileTrue: [
						MessageBox notify: 'Error: Ingrese un anio válido (mayor a 1900).'.
						nuevoDato := Prompter prompt: 'Ingresar nuevamente el anio del Auto: '.
					].
					anio := nuevoDato asNumber.
					
					nuevoDato := Prompter prompt: 'Ingresar el precio del Auto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
						MessageBox notify: 'El precio debe ser mayor a 0.'.
						nuevoDato := Prompter prompt: 'Ingrese nuevamente el precio del Auto: '.
					].
					precio := nuevoDato asNumber.
					
					nuevoDato := Prompter prompt: 'Ingresar el kilometraje del Auto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber < 0]]] whileTrue: [
						MessageBox notify: 'El kilometraje no puede ser negativo.'.
						nuevoDato := Prompter prompt: 'Ingrese nuevamente el kilometraje del Auto: '.
					].
					kilometraje := nuevoDato asNumber.
					
					"Selección de estado mediante ChoicePrompter con validación"
					estado := ChoicePrompter 
						choices: #('Disponible' 'Reservado' 'Vendido') 
						caption: 'Seleccione el estado del Auto'.
					[estado isNil] whileTrue: [
						MessageBox notify: 'Debe seleccionar un estado para el Auto.'.
						estado := ChoicePrompter 
							choices: #('Disponible' 'Reservado' 'Vendido') 
							caption: 'Seleccione el estado del Auto'.
					].

					nuevoDato := Prompter prompt: 'Ingresar la cant. de puertas del Auto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
						MessageBox notify: 'La cantidad de puertas debe ser mayor a 0.'.
						nuevoDato := Prompter prompt: 'Ingresar nuevamente la cant. de puertas del Auto: '.
					].
					puertas := nuevoDato asNumber.

					nuevoDato := Prompter prompt: 'Ingresar la capacidad del baul del Auto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
						MessageBox notify: 'La capacidad del baul debe ser mayor a 0.'.
						nuevoDato := Prompter prompt: 'Ingresar nuevamente la capacidad del baul del Auto: '.
					].
					capbaul := nuevoDato asNumber.
					
					auto := Autos crearAuto: patente con: marca con: modelo con: anio con: precio con: kilometraje con: estado con: puertas con: capbaul.
					concesionaria agregar: auto.
					Transcript show: 'Auto ingresado correctamente (Tipo: ', auto tipoDeVehiculo printString, ').'; cr; cr.
				].

				"--- INGRESO DE MOTO ---"
				(opcion = '2-Ingresar Moto') ifTrue: [
					patente := Prompter prompt: 'Ingresar la patente de la Moto: '.
					[(patente isNil) or: [patente isEmpty or: [((concesionaria verTodos) detect: [:unVehi | unVehi verPatente = patente] ifNone: [nil]) notNil]]] whileTrue: [
						MessageBox notify: 'Error: La patente no puede estar vacía ni repetirse con otro vehículo.'.
						patente := Prompter prompt: 'Ingresar una patente válida y diferente para la Moto: '.
					].

					marca := Prompter prompt: 'Ingresar la marca de la Moto: '.
					[(marca isNil) or: [marca isEmpty]] whileTrue: [
						MessageBox notify: 'Error: Debe ingresar una marca válida.'.
						marca := Prompter prompt: 'Ingresar nuevamente la marca de la Moto: '.
					].

					modelo := Prompter prompt: 'Ingresar el modelo de la Moto: '.
					[(modelo isNil) or: [modelo isEmpty]] whileTrue: [
						MessageBox notify: 'Error: Debe ingresar un modelo válido.'.
						modelo := Prompter prompt: 'Ingresar nuevamente el modelo de la Moto: '.
					].

					nuevoDato := Prompter prompt: 'Ingresar el anio de la Moto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 1900]]] whileTrue: [
						MessageBox notify: 'Error: Ingrese un anio válido (mayor a 1900).'.
						nuevoDato := Prompter prompt: 'Ingresar nuevamente el anio de la Moto: '.
					].
					anio := nuevoDato asNumber.
					
					nuevoDato := Prompter prompt: 'Ingrese el precio de la Moto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
						MessageBox notify: 'El precio debe ser mayor a 0.'.
						nuevoDato := Prompter prompt: 'Ingrese nuevamente el precio de la Moto: '.
					].
					precio := nuevoDato asNumber.
					
					nuevoDato := Prompter prompt: 'Ingresar el kilometraje de la Moto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber < 0]]] whileTrue: [
						MessageBox notify: 'El kilometraje no puede ser negativo.'.
						nuevoDato := Prompter prompt: 'Ingrese nuevamente el kilometraje de la Moto: '.
					].
					kilometraje := nuevoDato asNumber.
					
					"Selección de estado mediante ChoicePrompter con validación"
					estado := ChoicePrompter 
						choices: #('Disponible' 'Reservado' 'Vendido') 
						caption: 'Seleccione el estado de la Moto'.
					[estado isNil] whileTrue: [
						MessageBox notify: 'Debe seleccionar un estado para la Moto.'.
						estado := ChoicePrompter 
							choices: #('Disponible' 'Reservado' 'Vendido') 
							caption: 'Seleccione el estado de la Moto'.
					].

					nuevoDato := Prompter prompt: 'Ingresar la cilindrada de la Moto: '.
					[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
						MessageBox notify: 'La cilindrada debe ser mayor a 0.'.
						nuevoDato := Prompter prompt: 'Ingresar nuevamente la cilindrada de la Moto: '.
					].
					cilindrada := nuevoDato asNumber.
					
					"Selección de ABS mediante ChoicePrompter con validación"
					abs := ChoicePrompter 
						choices: #('si' 'no') 
						caption: '¿La Moto tiene ABS?'.
					[abs isNil] whileTrue: [
						MessageBox notify: 'Debe seleccionar si la Moto tiene ABS o no.'.
						abs := ChoicePrompter 
							choices: #('si' 'no') 
							caption: '¿La Moto tiene ABS?'.
					].
					
					moto := Motos crearMoto: patente con: marca con: modelo con: anio con: precio con: kilometraje con: estado con: cilindrada con: abs.
					concesionaria agregar: moto.
					Transcript show: 'Moto ingresada correctamente (Tipo: ', moto tipoDeVehiculo printString, ').'; cr; cr.
				].
			].
		]
		ifFalse: [
			MessageBox notify: 'La concesionaria llegó a su capacidad máxima de vehículos.'.
			Transcript show: 'La concesionaria llegó a su capacidad máxima de vehículos...'; cr; cr.
		].
].

"====================================================================="
" 3. MENÚ PRINCIPAL INTERACTIVO CON BUCLE WHILE"
"====================================================================="
seguir := true.

[seguir] whileTrue: [
	(concesionaria esVacio) ifTrue: [
		MessageBox notify: 'No hay vehículos cargados en la concesionaria para operar.'.
		seguir := false.
	] ifFalse: [
		opcion := ChoicePrompter 
			choices: #(
				'1-Consultar datos del Vehículo' 
				'2-Modificar datos del Vehículo' 
				'3-Eliminar Vehículo' 
				'4-Listados y filtros de vehículos'
				'5-Calcular costo de seguro' 
				'6-Estadísticas y seguros de disponibles' 
				'7-Administración del stock'
			) 
			caption: 'Menú Principal - Seleccione una opción'.

		(opcion isNil) ifTrue: [
			MessageBox notify: 'No seleccionó ninguna opción.'.
		] ifFalse: [

			"--- 1. CONSULTAR DATOS DEL VEHICULO ---"
			(opcion = '1-Consultar datos del Vehículo') ifTrue: [
				patenteBuscada := Prompter prompt: 'Ingrese la patente del vehículo a consultar:'.
				[(patenteBuscada isNil) or: [patenteBuscada isEmpty]] whileTrue: [
					MessageBox notify: 'Debe ingresar una patente válida para buscar.'.
					patenteBuscada := Prompter prompt: 'Ingrese nuevamente la patente del vehículo a consultar:'.
				].

				vehiculoBuscado := (concesionaria verTodos) detect: [:unVehi | unVehi verPatente = patenteBuscada] ifNone: [nil].

				(vehiculoBuscado isNil) ifTrue: [
					MessageBox notify: 'No se encontró ningún vehículo con la patente: ', patenteBuscada.
				] ifFalse: [
					Transcript 
						show: '---------------------------------------------------'; cr;
						show: '--- MOSTRANDO DATOS DEL VEHÍCULO ---'; cr;
						show: 'Tipo de Vehículo: ', vehiculoBuscado tipoDeVehiculo printString; cr;
						show: 'Patente: ', vehiculoBuscado verPatente; cr;
						show: 'Marca: ', vehiculoBuscado verMarca; cr;
						show: 'Modelo: ', vehiculoBuscado verModelo; cr;
						show: 'Anio: ', vehiculoBuscado verAnio printString; cr;
						show: 'Precio: $', vehiculoBuscado verPrecio printString; cr;
						show: 'Kilometraje: ', vehiculoBuscado verKilometraje printString; cr;
						show: 'Estado: ', vehiculoBuscado verEstado; cr.
					
					(vehiculoBuscado tipoDeVehiculo = #Autos) ifTrue: [
						Transcript
							show: 'Puertas: ', vehiculoBuscado verPuertas printString; cr;
							show: 'Capacidad de Baul: ', vehiculoBuscado verCapbaul printString; cr;
							cr; cr.
					] ifFalse: [
						Transcript
							show: 'Cilindrada: ', vehiculoBuscado verCilindrada printString; cr;
							show: 'Tiene ABS: ', vehiculoBuscado verAbs; cr;
							cr; cr.
					].
				].
			].

			"--- 2. MODIFICAR DATOS DEL VEHICULO ---"
			(opcion = '2-Modificar datos del Vehículo') ifTrue: [
				patenteBuscada := Prompter prompt: 'Ingrese la patente del vehículo a modificar:'.
				[(patenteBuscada isNil) or: [patenteBuscada isEmpty]] whileTrue: [
					MessageBox notify: 'Debe ingresar una patente válida para buscar.'.
					patenteBuscada := Prompter prompt: 'Ingrese nuevamente la patente del vehículo a modificar:'.
				].

				vehiculoBuscado := (concesionaria verTodos) detect: [:unVehi | unVehi verPatente = patenteBuscada] ifNone: [nil].

				(vehiculoBuscado isNil) ifTrue: [
					MessageBox notify: 'No se encontró ningún vehículo con la patente: ', patenteBuscada.
				] ifFalse: [
					(vehiculoBuscado tipoDeVehiculo = #Autos) ifTrue: [
						subOpcion := ChoicePrompter 
							choices: #('1-Patente' '2-Marca' '3-Modelo' '4-Anio' '5-Precio' '6-Kilometraje' '7-Estado' '8-Cant. Puertas' '9-Capacidad del Baul') 
							caption: 'Seleccione el dato a modificar'.
					] ifFalse: [
						subOpcion := ChoicePrompter 
							choices: #('1-Patente' '2-Marca' '3-Modelo' '4-Anio' '5-Precio' '6-Kilometraje' '7-Estado' '8-Cilindrada' '9-Tiene ABS') 
							caption: 'Seleccione el dato a modificar'.
					].

					(subOpcion isNil) ifTrue: [
						MessageBox notify: 'Modificación cancelada.'.
					] ifFalse: [
						(subOpcion = '1-Patente') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese la nueva patente:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty or: [((concesionaria verTodos) detect: [:unVehi | (unVehi verPatente = nuevoDato) and: [unVehi ~= vehiculoBuscado]] ifNone: [nil]) notNil]]] whileTrue: [
								MessageBox notify: 'Error: La patente no puede ser vacía ni pertenecer a otro vehículo registrado.'.
								nuevoDato := Prompter prompt: 'Ingrese una nueva patente válida:'.
							].
							vehiculoBuscado modPatente: nuevoDato.
						].
						(subOpcion = '2-Marca') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese la nueva marca:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty]] whileTrue: [
								MessageBox notify: 'La marca no puede estar vacía.'.
								nuevoDato := Prompter prompt: 'Ingrese nuevamente la nueva marca:'.
							].
							vehiculoBuscado modMarca: nuevoDato.
						].
						(subOpcion = '3-Modelo') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese el nuevo modelo:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty]] whileTrue: [
								MessageBox notify: 'El modelo no puede estar vacío.'.
								nuevoDato := Prompter prompt: 'Ingrese nuevamente el nuevo modelo:'.
							].
							vehiculoBuscado modModelo: nuevoDato.
						].
						(subOpcion = '4-Anio') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese el nuevo anio:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 1900]]] whileTrue: [
								MessageBox notify: 'El anio debe ser mayor a 1900.'.
								nuevoDato := Prompter prompt: 'Ingrese nuevamente el nuevo anio:'.
							].
							vehiculoBuscado modAnio: nuevoDato asNumber.
						].
						(subOpcion = '5-Precio') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese el nuevo precio:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
								MessageBox notify: 'El precio debe ser mayor a 0.'.
								nuevoDato := Prompter prompt: 'Ingrese nuevamente el nuevo precio:'.
							].
							vehiculoBuscado modPrecio: nuevoDato asNumber.
						].
						(subOpcion = '6-Kilometraje') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese el nuevo kilometraje:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber < 0]]] whileTrue: [
								MessageBox notify: 'El kilometraje no puede ser negativo.'.
								nuevoDato := Prompter prompt: 'Ingrese nuevamente el nuevo kilometraje:'.
							].
							vehiculoBuscado modKilometraje: nuevoDato asNumber.
						].
						(subOpcion = '7-Estado') ifTrue: [
							nuevoDato := ChoicePrompter choices: #('Disponible' 'Reservado' 'Vendido') caption: 'Seleccione el nuevo estado'.
							[nuevoDato isNil] whileTrue: [
								MessageBox notify: 'Debe seleccionar un estado válido.'.
								nuevoDato := ChoicePrompter choices: #('Disponible' 'Reservado' 'Vendido') caption: 'Seleccione el nuevo estado'.
							].
							vehiculoBuscado modEstado: nuevoDato.
						].
						(subOpcion = '8-Cant. Puertas') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese la nueva cantidad de puertas:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
								MessageBox notify: 'La cantidad de puertas debe ser mayor a 0.'.
								nuevoDato := Prompter prompt: 'Ingrese nuevamente la cantidad de puertas:'.
							].
							vehiculoBuscado modPuertas: nuevoDato asNumber.
						].
						(subOpcion = '9-Capacidad del Baul') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese la nueva capacidad del baul:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
								MessageBox notify: 'La capacidad del baul debe ser mayor a 0.'.
								nuevoDato := Prompter prompt: 'Ingrese nuevamente la capacidad del baul:'.
							].
							vehiculoBuscado modCapbaul: nuevoDato asNumber.
						].
						(subOpcion = '8-Cilindrada') ifTrue: [
							nuevoDato := Prompter prompt: 'Ingrese la nueva cilindrada:'.
							[(nuevoDato isNil) or: [nuevoDato isEmpty or: [nuevoDato asNumber <= 0]]] whileTrue: [
								MessageBox notify: 'La cilindrada debe ser mayor a 0.'.
								nuevoDato := Prompter prompt: 'Ingrese nuevamente la nueva cilindrada:'.
							].
							vehiculoBuscado modCilindrada: nuevoDato asNumber.
						].
						(subOpcion = '9-Tiene ABS') ifTrue: [
							nuevoDato := ChoicePrompter choices: #('si' 'no') caption: 'Seleccione si tiene ABS'.
							[nuevoDato isNil] whileTrue: [
								MessageBox notify: 'Debe seleccionar una opción de ABS.'.
								nuevoDato := ChoicePrompter choices: #('si' 'no') caption: 'Seleccione si tiene ABS'.
							].
							vehiculoBuscado modAbs: nuevoDato.
						].

						Transcript 
							show: '---------------------------------------------------'; cr;
							show: '--- VEHÍCULO MODIFICADO CORRECTAMENTE ---'; cr; cr; cr.
					].
				].
			].

			"--- 3. ELIMINAR VEHICULO ---"
			(opcion = '3-Eliminar Vehículo') ifTrue: [
				patenteBuscada := Prompter prompt: 'Ingrese la patente del vehículo a eliminar:'.
				[(patenteBuscada isNil) or: [patenteBuscada isEmpty]] whileTrue: [
					MessageBox notify: 'Debe ingresar una patente válida para eliminar.'.
					patenteBuscada := Prompter prompt: 'Ingrese nuevamente la patente del vehículo a eliminar:'.
				].

				vehiculoBuscado := (concesionaria verTodos) detect: [:unVehi | unVehi verPatente = patenteBuscada] ifNone: [nil].

				(vehiculoBuscado isNil) ifTrue: [
					MessageBox notify: 'No se encontró ningún vehículo con la patente: ', patenteBuscada.
				] ifFalse: [
					concesionaria eliminar: vehiculoBuscado.
					Transcript 
						show: '---------------------------------------------------'; cr;
						show: '--- VEHÍCULO ELIMINADO DE LA CONCESIONARIA ---'; cr; cr; cr.
					MessageBox notify: 'El vehículo con patente ', patenteBuscada, ' fue eliminado.'.
				].
			].

			"--- 4. LISTADOS Y FILTROS ---"
			(opcion = '4-Listados y filtros de vehículos') ifTrue: [
				listadoAntes2015 := (concesionaria verTodos) select: [:unVehi | unVehi verAnio < 2015].
				listadoMenor30mil := (concesionaria verTodos) select: [:unVehi | unVehi verKilometraje < 30000].

				marcaBuscada := Prompter prompt: 'Ingrese la marca del vehículo que desea buscar:'.
				[(marcaBuscada isNil) or: [marcaBuscada isEmpty]] whileTrue: [
					MessageBox notify: 'Debe ingresar un nombre de marca válido.'.
					marcaBuscada := Prompter prompt: 'Ingrese nuevamente la marca del vehículo que desea buscar:'.
				].
				listadoPorMarca := (concesionaria verTodos) select: [:unVehi | unVehi verMarca = marcaBuscada].

				Transcript 
					show: '---------------------------------------------------'; cr;
					show: '--- VEHICULOS FABRICADOS ANTES DEL 2015 ---'; cr; cr.
				(listadoAntes2015 isEmpty) ifTrue: [
					Transcript show: 'No hay vehículos fabricados antes del año 2015.'; cr; cr; cr.
				] ifFalse: [
					listadoAntes2015 do: [:unVehi |
						Transcript show: 'Tipo: ', unVehi tipoDeVehiculo printString, ' | Patente: ', unVehi verPatente, ' | Marca: ', unVehi verMarca, ' | Anio: ', unVehi verAnio printString; cr.
					].
					Transcript cr; cr.
				].

				Transcript show: '--- VEHICULOS CON MENOS DE 30.000 KM ---'; cr; cr.
				(listadoMenor30mil isEmpty) ifTrue: [
					Transcript show: 'No hay vehículos con menos de 30.000 km.'; cr; cr; cr.
				] ifFalse: [
					listadoMenor30mil do: [:unVehi |
						Transcript show: 'Tipo: ', unVehi tipoDeVehiculo printString, ' | Patente: ', unVehi verPatente, ' | Kilometraje: ', unVehi verKilometraje printString, ' km'; cr.
					].
					Transcript cr; cr.
				].

				Transcript show: '--- VEHICULOS DE LA MARCA: ', marcaBuscada, ' ---'; cr; cr.
				(listadoPorMarca isEmpty) ifTrue: [
					Transcript show: 'No se encontraron vehículos registrados de la marca ', marcaBuscada, '.'; cr; cr; cr.
					MessageBox notify: 'No se encontraron vehículos de la marca: ', marcaBuscada.
				] ifFalse: [
					listadoPorMarca do: [:unVehi |
						Transcript show: 'Tipo: ', unVehi tipoDeVehiculo printString, ' | Patente: ', unVehi verPatente, ' | Modelo: ', unVehi verModelo, ' | Precio: $', unVehi verPrecio printString; cr.
					].
					Transcript cr; cr; cr.
				].
			].

			"--- 5. CALCULAR COSTO DE SEGURO INDIVIDUAL ---"
			(opcion = '5-Calcular costo de seguro') ifTrue: [
				patenteBuscada := Prompter prompt: 'Ingrese la patente del vehículo para calcular seguro:'.
				[(patenteBuscada isNil) or: [patenteBuscada isEmpty]] whileTrue: [
					MessageBox notify: 'Debe ingresar una patente válida.'.
					patenteBuscada := Prompter prompt: 'Ingrese nuevamente la patente del vehículo para calcular seguro:'.
				].

				vehiculoBuscado := (concesionaria verTodos) detect: [:unVehi | unVehi verPatente = patenteBuscada] ifNone: [nil].

				(vehiculoBuscado isNil) ifTrue: [
					MessageBox notify: 'No se encontró ningún vehículo con la patente: ', patenteBuscada.
				] ifFalse: [
					Transcript 
						show: '---------------------------------------------------'; cr;
						show: '--- CALCULO DE COSTO DE SEGURO ---'; cr;
						show: 'Tipo: ', vehiculoBuscado tipoDeVehiculo printString; cr;
						show: 'Vehículo patente: ', vehiculoBuscado verPatente; cr;
						show: 'Precio base: $', vehiculoBuscado verPrecio printString; cr;
						show: 'Costo estimado de seguro: $', vehiculoBuscado calcularCosto rounded printString; cr;
						cr; cr; cr.
				].
			].

			"--- 6. ESTADISTICAS Y SEGUROS DE DISPONIBLES ---"
			(opcion = '6-Estadísticas y seguros de disponibles') ifTrue: [
				disp := (concesionaria verTodos) select: [:unVehi | unVehi verEstado = 'Disponible'].

				(disp isEmpty) ifTrue: [
					MessageBox notify: 'No hay vehículos disponibles en la concesionaria para calcular estadísticas.'.
				] ifFalse: [
					sumaPromedio := 0.
					disp do: [:unVehi | sumaPromedio := sumaPromedio + unVehi verPrecio].
					promedio := (sumaPromedio / disp size) asFloat.

					limite := promedio * 1.5.
					autosCaros := disp select: [:unVehi | unVehi verPrecio > limite].

					masBarato := (disp asSortedCollection: [:a :b | a verPrecio < b verPrecio]) first.

					totalSeguros := 0.
					disp do: [:unVehi | totalSeguros := totalSeguros + unVehi calcularCosto].

					Transcript
						show: '---------------------------------------------------'; cr;
						show: '--- ESTADISTICAS Y SEGUROS DE VEHICULOS DISPONIBLES ---'; cr; cr;
						show: 'Precio promedio de disponibles: $', promedio asInteger printString; cr;
						show: 'Valor limite (1.5 veces el promedio): $', limite asInteger printString; cr; cr;
						show: '--- VEHICULOS QUE SUPERAN 1.5 VECES EL PROMEDIO ---'; cr; cr.

					(autosCaros isEmpty) ifTrue: [
						Transcript show: 'No hay vehículos que superen una vez y media el promedio.'; cr; cr.
					] ifFalse: [
						autosCaros do: [:unVehi |
							Transcript
								show: 'Tipo: ', unVehi tipoDeVehiculo printString, ' | Patente: ', unVehi verPatente, ' | Marca: ', unVehi verMarca, ' | Precio: $', unVehi verPrecio printString; cr.
						].
						Transcript cr; cr.
					].

					Transcript
						show: '--- VEHICULO DISPONIBLE DE MENOR PRECIO ---'; cr; cr;
						show: 'Tipo: ', masBarato tipoDeVehiculo printString; cr;
						show: 'Patente: ', masBarato verPatente; cr;
						show: 'Marca: ', masBarato verMarca; cr;
						show: 'Precio: $', masBarato verPrecio printString; cr;
						show: 'Costo de Seguro Estimado: $', masBarato calcularCosto rounded printString; cr; cr;
						show: '--- COSTO TOTAL DE SEGUROS ---'; cr; cr;
						show: 'Costo total estimado de seguros (unidades disponibles): $', totalSeguros rounded printString; cr;
						cr; cr; cr.
				].
			].

			"--- 7. ADMINISTRACION DEL STOCK ---"
			(opcion = '7-Administración del stock') ifTrue: [
				subOpcion := ChoicePrompter 
					choices: #('1-Eliminar todos los vehículos vendidos' '2-Mostrar cantidad de vehículos disponibles por marca') 
					caption: 'Administración del Stock - Seleccione una opción'.

				(subOpcion isNil) ifTrue: [
					MessageBox notify: 'No seleccionó ninguna opción de administración de stock.'.
				] ifFalse: [
					(subOpcion = '1-Eliminar todos los vehículos vendidos') ifTrue: [
						vendidos := (concesionaria verTodos) select: [:unVehi | unVehi verEstado = 'Vendido'].
						Transcript 
							show: '---------------------------------------------------'; cr;
							show: '--- ELIMINACION DE VEHICULOS VENDIDOS ---'; cr; cr.

						(vendidos isEmpty) ifTrue: [
							Transcript show: 'No hay vehículos vendidos para eliminar.'; cr; cr; cr.
							MessageBox notify: 'No hay vehículos vendidos en el stock.'.
						] ifFalse: [
							vendidos do: [:unVehi | concesionaria eliminar: unVehi ].
							Transcript 
								show: 'Cantidad de vehículos eliminados: ', vendidos size printString; cr;
								show: 'Cantidad actual de vehículos en stock: ', concesionaria tamanio printString; cr;
								cr; cr; cr.
						].
					].

					(subOpcion = '2-Mostrar cantidad de vehículos disponibles por marca') ifTrue: [
						diccionarioMarcas := Dictionary new.
						col := (concesionaria verTodos) select: [:el | el verEstado = 'Disponible'].

						(col isEmpty) ifTrue: [
							Transcript 
								show: '---------------------------------------------------'; cr;
								show: 'No hay vehículos disponibles.'; cr; cr; cr.
							MessageBox notify: 'No hay vehículos disponibles registrados.'.
						] ifFalse: [
							colMarcas := col collect: [:el | el verMarca].
							sinRep := colMarcas asSet.
							sinRep do: [:el | diccionarioMarcas at: el put: (colMarcas occurrencesOf: el)].

							Transcript 
								show: '---------------------------------------------------'; cr;
								show: '--- VEHICULOS DISPONIBLES POR MARCA ---'; cr; cr; cr.
							diccionarioMarcas keysDo: [:cla | 
								Transcript show: 'Marca: ', cla, '  |  Cantidad de vehículos disponibles: ', (diccionarioMarcas at: cla) displayString; cr; cr.
							].
							Transcript cr; cr; cr.
						].
					].
				].
			].
		].

		seguir := MessageBox confirm: '¿Desea ingresar otra opción del menú?'.
	].
].

Transcript 
	show: '---------------------------------------------------'; cr;
	show: '--- FIN DEL PROGRAMA ---'; cr; cr; cr.