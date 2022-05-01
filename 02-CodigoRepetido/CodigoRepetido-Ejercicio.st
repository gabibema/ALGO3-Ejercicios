!classDefinition: #CantAdd category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantAdd
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'va 5/1/2022 17:34:45'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self should: [CustomerBook new addCustomerNamed: 'John Lennon']  notTakeMoreThan: (Duration milliSeconds: 50).
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 5/1/2022 17:35:40'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney|
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWith: paulMcCartney.

	self should: [customerBook removeCustomerNamed: paulMcCartney.]  notTakeMoreThan: (Duration milliSeconds: 100).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 5/1/2022 16:49:34'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook |
	customerBook := CustomerBook new.
	
	self enElLibro: customerBook probarYCapturar: [customerBook addCustomerNamed: ''] conExcepcion: Error yEjecutar:  
	[ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
	self assert: customerBook isEmpty]
	
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 5/1/2022 16:49:10'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon|
	johnLennon := 'John Lennon'.	
	customerBook := CustomerBook newWith: johnLennon.
	
	self enElLibro: customerBook probarYCapturar: [customerBook removeCustomerNamed: 'Paul McCartney'.] 
	conExcepcion: NotFound yEjecutar: [ :anError | self assert: customerBook numberOfCustomers = 1.
				                                 self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 5/1/2022 17:01:17'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|

	paulMcCartney := 'Paul McCartney'.	
	customerBook := CustomerBook newWith: paulMcCartney.
	
 	self enElLibro: customerBook ejecutarOperaciones: [customerBook suspendCustomerNamed: paulMcCartney.
						    					self assert: (customerBook includesCustomerNamed: 											paulMcCartney).]   	          	  
	conCantidadDeActivosEsperados: 0  yCantidadDeSuspendidosEsperados: 1.
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 5/1/2022 17:02:46'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWith: paulMcCartney .
	
	self enElLibro: customerBook ejecutarOperaciones: [customerBook suspendCustomerNamed: paulMcCartney. 
						     customerBook removeCustomerNamed: paulMcCartney.
						     self deny: (customerBook includesCustomerNamed: paulMcCartney)]           	  	conCantidadDeActivosEsperados: 0  yCantidadDeSuspendidosEsperados: 0.
	



	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 5/1/2022 16:44:38'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon|
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook newWith: johnLennon.
	
	self enElLibro: customerBook probarYCapturar: [customerBook suspendCustomerNamed: 'Ringo Starr'.] 
	      conExcepcion: CantSuspend  yEjecutar: [ :anError | self assert: customerBook numberOfCustomers = 1.
		                                                           self assert: (customerBook includesCustomerNamed: johnLennon)].
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 5/1/2022 16:45:15'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon|
	johnLennon := 'John Lennon'.		
	customerBook := CustomerBook newWith: johnLennon.
	
	self enElLibro: customerBook probarYCapturar: [ customerBook suspendCustomerNamed: johnLennon.
								    	          customerBook suspendCustomerNamed:johnLennon.] 
	      conExcepcion: CantSuspend  yEjecutar: [ :anError | self assert: customerBook numberOfCustomers = 1.
		                                                           self assert: (customerBook includesCustomerNamed: johnLennon) ].

! !


!CustomerBookTest methodsFor: 'pruebas privadas' stamp: 'va 5/1/2022 17:00:35'!
enElLibro: customerBook ejecutarOperaciones: operaciones conCantidadDeActivosEsperados: numeroActivos yCantidadDeSuspendidosEsperados: numeroSuspendidos

	operaciones value.

	self assert: numeroActivos equals: customerBook numberOfActiveCustomers.
	self assert: numeroSuspendidos equals: customerBook numberOfSuspendedCustomers.
	self assert: numeroActivos + numeroSuspendidos equals: customerBook numberOfCustomers.

! !

!CustomerBookTest methodsFor: 'pruebas privadas' stamp: 'va 5/1/2022 17:40:56'!
enElLibro: customerBook  probarYCapturar: bloqueExcepcion conExcepcion: excepcion yEjecutar: bloqueDePruebas
	
	[bloqueExcepcion  value.
	self fail]
		on: excepcion
		do: [ :anError | 
			bloqueDePruebas value: anError.]! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !

!CustomerBook methodsFor: 'initialization' stamp: 'va 5/1/2022 16:26:35'!
initializeWith: persona

	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.
	self addCustomerNamed: persona.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'va 5/1/2022 17:38:55'!
removeCustomerNamed: aName 
 
	^active  remove: aName ifAbsent: [	
		suspended remove: aName ifAbsent: [^NotFound signal.]].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'va 5/1/2022 17:13:02'!
suspendCustomerNamed: aName 

	active detect: [:persona | persona = aName] ifFound: [:persona | active remove: persona. suspended add: persona.]
    	ifNone: [^CantSuspend signal]
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'algo3 4/30/2022 19:28:38'!
newWith: person
	| costumerBook |
	
	costumerBook  := self new.
	^costumerBook  addCustomerNamed: person.! !
