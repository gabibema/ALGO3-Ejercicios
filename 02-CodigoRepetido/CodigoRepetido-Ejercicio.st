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

!CustomerBookTest methodsFor: 'testing' stamp: 'algo3 4/30/2022 17:45:46'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	self assert: (Time millisecondsToRun: [CustomerBook new addCustomerNamed: 'John Lennon']) < (50 * millisecond)
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'algo3 4/30/2022 17:46:44'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'Paul McCartney'.
	
	self assert: (Time millisecondsToRun: [customerBook removeCustomerNamed: 'Paul McCartney'.]) < (100 * millisecond)
	

! !

!CustomerBookTest methodsFor: 'testing' stamp: 'algo3 4/30/2022 19:15:44'!
test03CanNotAddACustomerWithEmptyName 
	| customerBook |
	customerBook := CustomerBook new.
	
	self probarEn: customerBook capturar:  
	[customerBook addCustomerNamed: ''] conExcepcion: Error yEjecutar:  
	
	[ :anError | self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
	self assert: customerBook isEmpty]
	
	! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 4/30/2022 20:53:46'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon|
	johnLennon := 'John Lennon'.	
	customerBook := CustomerBook newWith: johnLennon.
	
	self  probarEn: customerBook capturar: [customerBook removeCustomerNamed: 'Paul McCartney'.] 
		conExcepcion: NotFound yEjecutar: [ :anError | self assert: customerBook numberOfCustomers = 1.
				                                        self assert: (customerBook includesCustomerNamed: johnLennon) ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 4/30/2022 20:51:32'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|

	paulMcCartney := 'Paul McCartney'.	
	customerBook := CustomerBook newWith:paulMcCartney.
	
	self xxx: customerBook yyy: [customerBook suspendCustomerNamed: paulMcCartney.
						     self assert: (customerBook includesCustomerNamed: paulMcCartney).] 
	cantidadDe: 0   cantidadDe: 1. 

	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 4/30/2022 20:50:02'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	paulMcCartney := 'Paul McCartney'.
	customerBook := CustomerBook newWith: paulMcCartney .
	
	self xxx: customerBook yyy: [customerBook suspendCustomerNamed: paulMcCartney. 
						     customerBook removeCustomerNamed: paulMcCartney.
						     self deny: (customerBook includesCustomerNamed: paulMcCartney)] 
	cantidadDe: 0   cantidadDe: 0. 
	
	"preguntar como hacer un assert con booleanos"

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 4/30/2022 20:53:17'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon|
	johnLennon := 'John Lennon'.
	customerBook := CustomerBook newWith: johnLennon.
	
	self probarEn: customerBook capturar: [customerBook suspendCustomerNamed: 'Ringo Starr'.] 
	      conExcepcion: CantSuspend  yEjecutar: [ :anError | self assert: customerBook numberOfCustomers = 1.
		                                                           self assert: (customerBook includesCustomerNamed: johnLennon)].
		! !

!CustomerBookTest methodsFor: 'testing' stamp: 'va 4/30/2022 20:52:47'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon|
	johnLennon := 'John Lennon'.		
	customerBook := CustomerBook newWith: johnLennon.
	
	self probarEn: customerBook capturar: [ customerBook suspendCustomerNamed: 'John Lennon'.
								     customerBook     suspendCustomerNamed: 'John Lennon'.] 
	      conExcepcion: CantSuspend  yEjecutar: [ :anError | self assert: customerBook numberOfCustomers = 1.
		                                                           self assert: (customerBook includesCustomerNamed: johnLennon) ].

! !


!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'algo3 4/30/2022 18:45:17'!
probarEn: customerBook agregandoA: persona yCapturar: bloqueExcepcion 
	
	customerBook addCustomerNamed: persona.
	[bloqueExcepcion  value.
	self fail]
		on: Error "Hardcodeado"
		do: [ :anError | 
			self assert: ((customerBook numberOfCustomers = 1) and: (customerBook includesCustomerNamed: persona))] "Harcodeado"! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'algo3 4/30/2022 19:15:56'!
probarEn: customerBook  capturar: bloqueExcepcion conExcepcion: excepcion yEjecutar: bloque
	
	[bloqueExcepcion  value.
	self fail]
		on: excepcion
		do: [ :anError | 
			bloque value: anError.]! !

!CustomerBookTest methodsFor: 'as yet unclassified' stamp: 'va 4/30/2022 20:47:56'!
xxx: customerBook yyy: clousure cantidadDe: activos cantidadDe: suspendidos

	clousure value.

	self assert: activos equals: customerBook numberOfActiveCustomers.
	self assert: suspendidos equals: customerBook numberOfSuspendedCustomers.
	self assert: activos + suspendidos equals: customerBook numberOfCustomers.

! !


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

!CustomerBook methodsFor: 'initialization' stamp: 'va 4/30/2022 19:26:55'!
initializeWith: aaaaa

	super initialize.
	active := OrderedCollection new.
	suspended := OrderedCollection new.
	self addCustomerNamed: aaaaa.! !


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

!CustomerBook methodsFor: 'customer management' stamp: 'algo3 4/30/2022 17:02:37'!
removeCustomerNamed: aName 
 
	^active  remove: aName ifAbsent: [	
		suspended remove: aName ifAbsent: [^NotFound signal.]
	].! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'algo3 4/30/2022 17:35:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	suspended add: aName
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
