!classDefinition: #Habitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Habitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Habitat class' category: 'AvispasYAbejasParte2'!
Habitat class
	instanceVariableNames: 'cantidadDePolillas cantidadDeHuevosPuestos cantidadDeOrugas registroDeHuevosPuestos'!

!Habitat class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 12:20:21'!
agregarHuevoDe: Avispa
		| cantidadDeHuevosDeAvispa |.
		  cantidadDeHuevosDeAvispa := self cantidadDeHuevosConFirmaGenetica: Avispa.
		  cantidadDeHuevosPuestos  := cantidadDeHuevosPuestos  + 1.
				
		^registroDeHuevosPuestos at: Avispa asString put: cantidadDeHuevosDeAvispa + 1. 	

! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 09:38:48'!
agregarOruga
	cantidadDeOrugas := cantidadDeOrugas  + 1.
	! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 10:27:04'!
agregarPolilla
	cantidadDePolillas := cantidadDePolillas + 1.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 13:19:40'!
avispaConHuevosPuestos
	((self cantidadDeHuevosConFirmaGenetica: self laAvispaOriana asString) > 0) ifTrue: [^self laAvispaOriana asString].
	((self cantidadDeHuevosConFirmaGenetica: self laAvispaPolly asString) > 0) ifTrue: [^self laAvispaPolly asString] ifFalse: [^nil].
	
! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 11:04:33'!
cantidadDeHuevosConFirmaGenetica: Avispa
	^registroDeHuevosPuestos at: Avispa ifAbsent: 0. ! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/21/2022 20:34:13'!
cantidadDeHuevosDeAvispas
	^ cantidadDeHuevosPuestos.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 09:42:40'!
cantidadDeOrugas
	^cantidadDeOrugas.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 10:27:42'!
cantidadDePolillas
	^cantidadDePolillas.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 09:39:02'!
consumirOruga
	cantidadDeOrugas := cantidadDeOrugas  -1.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 10:22:18'!
consumirPolilla
	cantidadDePolillas := cantidadDePolillas  -1.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 11:31:30'!
laAvispaLara
	^LaAvispaLara.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/21/2022 20:47:03'!
laAvispaOriana
	^LaAvispaOriana.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 10:11:31'!
laAvispaOrnella
	^LaAvispaOrnella.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 10:23:42'!
laAvispaPolly
	^LaAvispaPolly.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 12:22:22'!
quitarHuevoDe: Avispa
	| cantidadDeHuevosDeAvispa |.
	 cantidadDeHuevosDeAvispa := self cantidadDeHuevosConFirmaGenetica: Avispa.
	
	registroDeHuevosPuestos at: Avispa asString put: cantidadDeHuevosDeAvispa - 1. 	
	cantidadDeHuevosPuestos := cantidadDeHuevosPuestos - 1.
! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 12:17:36'!
retrocederHuevos
	registroDeHuevosPuestos := Dictionary new.
	registroDeHuevosPuestos at: self laAvispaOriana asString put: 0.
	registroDeHuevosPuestos at: self laAvispaPolly asString put: 0.
	registroDeHuevosPuestos at: self laAvispaLara asString put: 0.
	cantidadDeHuevosPuestos  := 0.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 09:39:14'!
retrocederOrugas
	cantidadDeOrugas := 0.
! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 10:32:58'!
retrocederPolillas
	cantidadDePolillas  := 0.! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 12:03:25'!
tieneHuevosSuficientes
	"|hayHuevosSuficientes|
	hayHuevosSuficientes := False."
	^self cantidadDeHuevosConFirmaGenetica: self laAvispaOriana asString > 0. "ifTrue: [hayHuevosSuficientes := True]."
	"[self cantidadDeHuevosConFirmaGenetica: self laAvispaOriana asString > 0] ifTrue: [hayHuevosSuficientes := True]
	[self cantidadDeHuevosConFirmaGenetica: self laAvispaOriana asString > 0] ifTrue: [hayHuevosSuficientes := True]."! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 09:48:58'!
tieneOrugasSuficientes
	^cantidadDeOrugas  > 0.

	! !

!Habitat class methodsFor: 'as yet unclassified' stamp: 'algo3 4/22/2022 10:22:44'!
tienePolillasSuficientes
	^cantidadDePolillas  > 0.
! !


!Habitat class methodsFor: '--** private fileout/in **--' stamp: 'va 4/23/2022 13:20:55'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	cantidadDePolillas := 1.
	cantidadDeHuevosPuestos := 2.
	cantidadDeOrugas := 0.
	registroDeHuevosPuestos := ((Dictionary new) add: ('LaAvispaLara'->0); add: ('LaAvispaOriana'->2); add: ('LaAvispaPolly'->0); yourself).! !


!classDefinition: #LaAvispaLara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaLara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaLara class' category: 'AvispasYAbejasParte2'!
LaAvispaLara class
	instanceVariableNames: ''!

!LaAvispaLara class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 13:09:47'!
intentarReproducirse
	|avispaASerRobada|
	avispaASerRobada := Habitat avispaConHuevosPuestos.
	
	avispaASerRobada ~= nil ifTrue: 
	[Habitat quitarHuevoDe: avispaASerRobada.
	Habitat agregarHuevoDe: self asString].! !


!classDefinition: #LaAvispaOriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaOriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaOriana class' category: 'AvispasYAbejasParte2'!
LaAvispaOriana class
	instanceVariableNames: ''!

!LaAvispaOriana class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 12:25:35'!
intentarReproducirse
	Habitat tieneOrugasSuficientes ifTrue: 
	[ Habitat agregarHuevoDe: LaAvispaOriana asString.
	  Habitat consumirOruga. ].! !


!classDefinition: #LaAvispaOrnella category: 'AvispasYAbejasParte2'!
LaAvispaOriana subclass: #LaAvispaOrnella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #LaAvispaPolly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #LaAvispaPolly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LaAvispaPolly class' category: 'AvispasYAbejasParte2'!
LaAvispaPolly class
	instanceVariableNames: ''!

!LaAvispaPolly class methodsFor: 'as yet unclassified' stamp: 'va 4/23/2022 12:25:45'!
intentarReproducirse
	Habitat tienePolillasSuficientes ifTrue: 
	[ Habitat agregarHuevoDe: self asString.
	  Habitat consumirPolilla.].! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'algo3 4/21/2022 20:46:48'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'algo3 4/21/2022 20:47:03'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'algo3 4/21/2022 20:47:03'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'algo3 4/21/2022 20:47:03'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'algo3 4/21/2022 20:47:03'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'algo3 4/21/2022 20:47:03'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'algo3 4/21/2022 20:46:48'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'algo3 4/21/2022 20:46:48'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'algo3 4/21/2022 20:46:48'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'algo3 4/21/2022 20:46:48'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'algo3 4/21/2022 20:46:48'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'algo3 4/21/2022 20:46:48'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'algo3 4/21/2022 20:46:48'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'algo3 4/21/2022 20:47:03'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'algo3 4/21/2022 20:47:03'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'va 4/23/2022 11:20:33'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
	isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:27'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'algo3 4/21/2022 20:47:03'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'va 4/23/2022 12:24:22'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^self habitat cantidadDeHuevosConFirmaGenetica: self habitat laAvispaLara asString.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'va 4/23/2022 11:17:48'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^self habitat cantidadDeHuevosConFirmaGenetica: self habitat laAvispaOriana asString.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'va 4/23/2022 11:24:07'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^self habitat cantidadDeHuevosConFirmaGenetica: self habitat laAvispaOriana asString.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'va 4/23/2022 11:18:39'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^self habitat cantidadDeHuevosConFirmaGenetica: self habitat laAvispaPolly asString.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/21/2022 20:46:48'!
habitat
	^Habitat ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/22/2022 10:34:39'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat  agregarOruga.
	self habitat  agregarOruga.
	self habitat  agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'va 4/23/2022 11:32:13'!
laAvispaLara
	^self habitat laAvispaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/22/2022 10:12:02'!
laAvispaOriana
	^self habitat laAvispaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/22/2022 10:12:12'!
laAvispaOrnella
	^self habitat laAvispaOrnella.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/22/2022 10:24:33'!
laAvispaPolly
	^self habitat laAvispaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/22/2022 09:42:16'!
queElHabitatTengaDosOrugasMas
	self habitat agregarOruga .
	self habitat agregarOruga .
	
	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/22/2022 10:31:04'!
queElHabitatTengaDosPolillasMas
	self habitat agregarPolilla.
	self habitat  agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/22/2022 09:32:49'!
queElHabitatTengaUnaOrugaMas
	self habitat agregarOruga.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'algo3 4/22/2022 10:26:38'!
queElHabitatTengaUnaPolillaMas
	self habitat agregarPolilla.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'va 4/23/2022 11:01:19'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat retrocederHuevos.
	self habitat retrocederOrugas.
	self habitat retrocederPolillas.! !

Habitat initializeAfterFileIn!