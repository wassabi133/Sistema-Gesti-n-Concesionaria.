"Filed out from Dolphin Smalltalk"!

Vehiculos subclass: #Autos
	instanceVariableNames: 'puertas capbaul'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Autos guid: (GUID fromString: '{f6013e65-f891-44c0-bab6-3cf05df5a5f5}')!

Autos comment: ''!

!Autos categoriesForClass!Kernel-Objects! !

!Autos methodsFor!

calcularCosto
	^(self verPrecio * 0.03) + ((self verAnio < 2015) ifTrue: [self verPrecio * 0.01] ifFalse: [0])!

iniciar:UnaPatente con:UnaMarca con:UnModelo con:UnAnio con:UnPrecio con:UnKilometraje con:UnEstado con:UnasPuertas con:UnaCapbaul
self iniciar: UnaPatente con: UnaMarca con: UnModelo con: UnAnio con: UnPrecio con: UnKilometraje con: UnEstado.
puertas := UnasPuertas.
capbaul := UnaCapbaul.!

modCapbaul: otraCapbaul
	capbaul:=otraCapbaul.!

modPuertas: otraPuerta
	puertas:=otraPuerta.!

verCapbaul
	^capbaul!

verPuertas
	^puertas! !

!Autos categoriesForMethods!
calcularCosto!public! !
iniciar:con:con:con:con:con:con:con:con:!public! !
modCapbaul:!public! !
modPuertas:!public! !
verCapbaul!public! !
verPuertas!public! !
!

!Autos class methodsFor!

crearAuto: patente con: marca con: modelo con: anio con: precio con: kilometraje con: estado con: puertas con: capbaul
	^self new iniciar:patente con:marca con:modelo con:anio con:precio con:kilometraje con:estado con: puertas con: capbaul! !

!Autos class categoriesForMethods!
crearAuto:con:con:con:con:con:con:con:con:!public! !
!

