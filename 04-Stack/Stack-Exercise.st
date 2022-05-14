!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'algo3 5/14/2022 15:40:02'!
test01canNotFindAnEmptyPrefix
	| aStack  aSentenceFinder|
	
	aStack := OOStack new.
	aSentenceFinder := SentenceFinderByPrefix new.
	
	[aSentenceFinder find: '' in: aStack] on: 
		Error do: 
			[:anError| self assert: anError messageText = SentenceFinderByPrefix invalidPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'algo3 5/14/2022 16:07:34'!
test02canNotFindAPrefixThatIncludesSpaces
	| aStack  aSentenceFinder|
	
	aStack := OOStack new.
	aSentenceFinder := SentenceFinderByPrefix new.
	
	[aSentenceFinder find: 'win ' in: aStack] on: 
		Error do: 
			[:anError| self assert: anError messageText = SentenceFinderByPrefix invalidPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'as yet unclassified' stamp: 'algo3 5/14/2022 16:33:23'!
test03theSentenceFinderIsCaseSensitive
	| aStack aSentenceFinder matches expectedMatches |
	aStack := OOStack new.
	aStack push: 'winter is coming'.
	aStack push: 'winning is everything'.
	aStack push: 'The winds of Winter'.
	aStack push: 'Winter is here'.
	
	aSentenceFinder := SentenceFinderByPrefix new.
	matches := aSentenceFinder find: 'Wint' in: aStack.
	expectedMatches := OrderedCollection with: 'Winter is here'.
	self assert:( matches includesAllOf: expectedMatches )	.
	
	
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefixTest class' category: 'Stack-Exercise'!
SentenceFinderByPrefixTest class
	instanceVariableNames: 'temporary'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'vALENKPA 5/12/2022 16:51:48'!
initialize
	elements := OrderedCollection new.
	status := Empty new.! !


!OOStack methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 17:11:40'!
elements
	^elements.! !

!OOStack methodsFor: 'stack operations' stamp: 'va 5/10/2022 20:37:26'!
isEmpty
	^ elements size = 0.! !

!OOStack methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 17:30:23'!
pop
	|pushedElement|
	
	pushedElement := status popFrom: self.
	status := (StackStatus subclasses detect: [:aStatus| aStatus canHold: self]) new.
	
	^pushedElement.! !

!OOStack methodsFor: 'stack operations' stamp: 'va 5/14/2022 14:56:00'!
popWhenNotEmpty
		^ elements removeFirst.! !

!OOStack methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 17:40:13'!
push: anElement
	elements addFirst: anElement. 
	status := NotEmpty new. "quizas hacer q no se cree uno nuevo siempre si ya tiene elementos"
	! !

!OOStack methodsFor: 'stack operations' stamp: 'va 5/10/2022 21:29:39'!
size
	^elements size.! !

!OOStack methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 17:08:00'!
top
	^status topOf: self.
! !

!OOStack methodsFor: 'stack operations' stamp: 'va 5/14/2022 14:54:55'!
topWhenNotEmpty
	^elements first.! !


!OOStack methodsFor: 'private' stamp: 'va 5/14/2022 15:00:47'!
canNotPopWhenEmpty
	^ self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'private' stamp: 'va 5/14/2022 15:00:57'!
canNotTopWhenEmpty
	^ self error: self class stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'algo3 5/14/2022 16:05:05'!
find: aPrefix in: aStack
	(self isAValidPrefix: aPrefix) ifTrue: [
		
		| auxiliarStack matchesCollection stackSize|
		
		auxiliarStack := OOStack new.
		matchesCollection := OrderedCollection new.
		stackSize := aStack size.
		
		stackSize timesRepeat: [
			
				auxiliarStack push: aStack pop.
				(auxiliarStack top beginsWith: aPrefix) ifTrue: [ matchesCollection add: auxiliarStack top].
			].
		
		stackSize timesRepeat: [aStack push: auxiliarStack  pop.].
			
			^matchesCollection.
		]
	
	! !

!SentenceFinderByPrefix methodsFor: 'as yet unclassified' stamp: 'algo3 5/14/2022 15:52:28'!
isAValidPrefix: aPrefix
	((aPrefix includesSubString: ' ')or: aPrefix = '') ifTrue: [ ^self error: self class invalidPrefixError].
	^true.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'algo3 5/14/2022 15:30:36'!
invalidPrefixError
	^'El prefijo no puede contener espacios vacios ni ser vacio'.! !


!classDefinition: #StackStatus category: 'Stack-Exercise'!
Object subclass: #StackStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStatus methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 16:56:50'!
popFrom: aStack
	self subclassResponsibility.! !

!StackStatus methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 17:03:54'!
topOf: aStack
	self subclassResponsibility.! !


!classDefinition: #Empty category: 'Stack-Exercise'!
StackStatus subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Empty methodsFor: 'stack operations' stamp: 'va 5/14/2022 15:00:28'!
popFrom: aStack
	^ aStack canNotPopWhenEmpty.! !

!Empty methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 17:04:32'!
topOf: aStack
	^ aStack error: aStack class stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'support' stamp: 'vALENKPA 5/12/2022 17:26:01'!
canHold: aStack
	^aStack isEmpty.! !


!classDefinition: #NotEmpty category: 'Stack-Exercise'!
StackStatus subclass: #NotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmpty methodsFor: 'stack operations' stamp: 'va 5/14/2022 15:02:07'!
popFrom: aStack
	^aStack popWhenNotEmpty.! !

!NotEmpty methodsFor: 'stack operations' stamp: 'va 5/14/2022 14:54:30'!
topOf: aStack
	^aStack topWhenNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmpty class' category: 'Stack-Exercise'!
NotEmpty class
	instanceVariableNames: ''!

!NotEmpty class methodsFor: 'support' stamp: 'vALENKPA 5/12/2022 17:44:28'!
canHold: aStack
	^aStack isEmpty not.! !
