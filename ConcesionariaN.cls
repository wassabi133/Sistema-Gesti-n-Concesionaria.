"Filed out from Dolphin Smalltalk"!

Object subclass: #Concesionaria
	instanceVariableNames: 'nombre sucursal ciudad capmax comision conjVehiculos'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

Concesionaria guid: (GUID fromString: '{967009e5-b5b9-48ff-af29-433e92ef0814}')!

Concesionaria comment: ''!

!Concesionaria categoriesForClass!Kernel-Objects! !

!Concesionaria methodsFor!

agregar: unVehi
	conjVehiculos add:unVehi.!

eliminar: unVehi
	conjVehiculos remove: unVehi ifAbsent:[^nil].!

esVacio
	^conjVehiculos isEmpty.!

iniciar: UnNom con: UnaSuc con: UnaCiud con: UnaCapmax con: UnaComision
nombre := UnNom.
sucursal := UnaSuc.
ciudad := UnaCiud.
capmax := UnaCapmax.
comision := UnaComision.
conjVehiculos := OrderedCollection new.!

modCapmax: otraCapmax
	capmax := otraCapmax.!

modCiudad: otraCiudad
	ciudad := otraCiudad.
!

modComision: otraComision
	comision := otraComision.!

modNombre: otroNom
	nombre:=otroNom.!

modSucursal: otraSucursal
	sucursal := otraSucursal.!

recuperar: i
	^conjVehiculos at: i.!

tamanio
	^conjVehiculos size.!

verCapmax
	^capmax!

verCiudad
	^ciudad
!

verComision
	^comision!

verNombre
	^nombre
!

verSucursal
	^sucursal!

verTodos
	^conjVehiculos! !

!Concesionaria categoriesForMethods!
agregar:!public! !
eliminar:!public! !
esVacio!public! !
iniciar:con:con:con:con:!public! !
modCapmax:!public! !
modCiudad:!public! !
modComision:!public! !
modNombre:!public! !
modSucursal:!public! !
recuperar:!public! !
tamanio!public! !
verCapmax!public! !
verCiudad!public! !
verComision!public! !
verNombre!public! !
verSucursal!public! !
verTodos!public! !
!

!Concesionaria class methodsFor!

crear: nombre con: sucursal con: ciudad con: capmax con: comision
	^self new iniciar: nombre con: sucursal con: ciudad con: capmax con: comision! !

!Concesionaria class categoriesForMethods!
crear:con:con:con:con:!public! !
!

