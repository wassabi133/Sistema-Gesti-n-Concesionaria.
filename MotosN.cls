"Filed out from Dolphin Smalltalk"!

Vehiculos subclass: #Motos
	instanceVariableNames: 'cilindrada tieneabs'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Motos guid: (GUID fromString: '{1292dc2f-7756-452a-98e4-48a2e28f0097}')!

Motos comment: ''!

!Motos categoriesForClass!Kernel-Objects! !

!Motos methodsFor!

calcularCosto
	^(self verPrecio * 0.02) + ((self verCilindrada > 300) ifTrue: [self verPrecio * 0.01] ifFalse: [0])!

iniciar:UnaPatente con:UnaMarca con:UnModelo con:UnAnio con:UnPrecio con:UnKilometraje con:UnEstado con:UnaCilindrada con:abs
self iniciar: UnaPatente con: UnaMarca con: UnModelo con: UnAnio con: UnPrecio con: UnKilometraje con: UnEstado.
cilindrada:=UnaCilindrada.
tieneabs := abs.
!

modAbs: otroAbs
	tieneabs := otroAbs.!

modCilindrada: otraCilindrada
	cilindrada := otraCilindrada.!

verAbs
	^tieneabs!

verCilindrada
	^cilindrada! !

!Motos categoriesForMethods!
calcularCosto!public! !
iniciar:con:con:con:con:con:con:con:con:!public! !
modAbs:!public! !
modCilindrada:!public! !
verAbs!public! !
verCilindrada!public! !
!

!Motos class methodsFor!

crearMoto: patente con: marca con: modelo con: anio con: precio con: kilometraje con: estado con: cilindrada con: tieneabs
	^self new iniciar:patente con:marca con:modelo con:anio con:precio con:kilometraje con:estado con: cilindrada con: tieneabs! !

!Motos class categoriesForMethods!
crearMoto:con:con:con:con:con:con:con:con:!public! !
!

