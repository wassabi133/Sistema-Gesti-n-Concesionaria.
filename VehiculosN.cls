"Filed out from Dolphin Smalltalk"!

Object subclass: #Vehiculos
	instanceVariableNames: 'patente marca modelo anio precio kilometraje estado'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Vehiculos guid: (GUID fromString: '{01195d0e-beaf-47a6-a78a-98e2b3bb8f01}')!

Vehiculos comment: ''!

!Vehiculos categoriesForClass!Kernel-Objects! !

!Vehiculos methodsFor!

calcularCosto
	^ self subclassResponsibility!

iniciar:UnaPatente con:UnaMarca con:UnModelo con:UnAnio con:UnPrecio con:UnKilometraje con:UnEstado
patente:=UnaPatente.
marca:=UnaMarca.
modelo:=UnModelo.
anio:=UnAnio.
precio:=UnPrecio.
kilometraje:=UnKilometraje.
estado := UnEstado.!

modAnio: otroAnio
	anio := otroAnio.
!

modEstado: otroEstado
	estado := otroEstado.!

modKilometraje: otroKilometraje
	kilometraje := otroKilometraje.
!

modMarca: OtraMarca
	marca := OtraMarca.!

modModelo: otroModelo
	modelo := otroModelo.!

modPatente: otraPatente
	patente := otraPatente.!

modPrecio: otroPrecio
	precio := otroPrecio.!

tipoDeVehiculo
	^self class name!

verAnio
	^anio!

verEstado
	^estado!

verKilometraje
	^kilometraje!

verMarca
	^marca!

verModelo
	^modelo!

verPatente
	^patente!

verPrecio
	^precio! !

!Vehiculos categoriesForMethods!
calcularCosto!public! !
iniciar:con:con:con:con:con:con:!public! !
modAnio:!public! !
modEstado:!public! !
modKilometraje:!public! !
modMarca:!public! !
modModelo:!public! !
modPatente:!public! !
modPrecio:!public! !
tipoDeVehiculo!public! !
verAnio!public! !
verEstado!public! !
verKilometraje!public! !
verMarca!public! !
verModelo!public! !
verPatente!public! !
verPrecio!public! !
!

!Vehiculos class methodsFor!

crear: patente con: marca con: modelo con: anio con: precio con: kilometraje con: estado
	^self new iniciar:patente con:marca con:modelo con:anio con:precio con:kilometraje con:estado ! !

!Vehiculos class categoriesForMethods!
crear:con:con:con:con:con:con:!public! !
!

