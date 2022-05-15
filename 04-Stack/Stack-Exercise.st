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

!OOStackTest methodsFor: 'test' stamp: 'va 5/14/2022 23:19:52'!
test11ALimitedStackCanBeCreatedSuccessfully
	|aStack|
	aStack := OOStack newWithLimit: 3.
	self deny: aStack = nil.
	
	
	! !

!OOStackTest methodsFor: 'test' stamp: 'va 5/14/2022 23:55:52'!
test12CanNotPushMoreElementsWhenTheStackIsFull
	|aStack|
	aStack := OOStack newWithLimit: 2.
	aStack push: 1.
	aStack push: 2.
	
	[aStack push: 3. self fail] 
		on: Error
		do: [:anError | self assert: anError messageText = OOStack stackPushInAFullStackErrorDescription].
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/14/2022 23:08:09'!
test01givenAnEmptyStackTheListOfMatchesIsEmpty
	| aStack aSentenceFinder |
	aStack := OOStack new.
	aSentenceFinder := SentenceFinderByPrefix new.

	self assert:( (aSentenceFinder find: 'hola' in: aStack) isEmpty)	.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/14/2022 23:56:16'!
test02canNotFindWithAPrefixThatIncludesSpaces
	| aStack  aSentenceFinder|
	
	aStack := OOStack new.
	aSentenceFinder := SentenceFinderByPrefix new.
	
	[aSentenceFinder find: 'win ' in: aStack. self fail] 
		on: Error 
		do: [:anError| self assert: anError messageText = SentenceFinderByPrefix invalidPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/14/2022 23:56:22'!
test03canNotFindWithAnEmptyPrefix
	| aStack  aSentenceFinder|
	
	aStack := OOStack new.
	aSentenceFinder := SentenceFinderByPrefix new.
	
	[aSentenceFinder find: '' in: aStack. self fail] 
		on: Error
		do: [:anError| self assert: anError messageText = SentenceFinderByPrefix invalidPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/14/2022 23:07:43'!
test04theSentenceFinderIsCaseSensitive
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

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/14/2022 16:53:26'!
test05afterFindingMatchesTheOriginalStackRemainsUnchanged
	| aStack aSentenceFinder |
	aStack := OOStack new.
	aStack push: 'winter'.
	aStack push: 'summer'.
	
	aSentenceFinder := SentenceFinderByPrefix new.
	aSentenceFinder find: 'wint' in: aStack.
	
	self assert:(aStack pop = 'summer' and: aStack pop = 'winter')	.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/14/2022 16:59:15'!
test06givenAStackWithRepeatedElementsTheListOfMatchesHaveThemAll
	| aStack aSentenceFinder matches expectedMatches |
	aStack := OOStack new.
	aStack push: 'winter is coming'.
	aStack push: 'winter is coming'.
	aStack push: 'winning is everything'.
	aStack push: 'winter is coming'.
	aStack push: 'The winds of Winter'.
	aStack push: 'Winter is here'.
	
	aSentenceFinder := SentenceFinderByPrefix new.
	matches := aSentenceFinder find: 'wint' in: aStack.
	expectedMatches := OrderedCollection new.
	3 timesRepeat: [expectedMatches add: 'winter is coming'].
	
	self assert: (matches includesAllOf: expectedMatches)	.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/14/2022 23:10:30'!
test07theListOfMatchesIsEmptyIfThereAreNoMatchesWithThePrefix
	| aStack aSentenceFinder |
	aStack := OOStack new.
	aStack push: 'algoritmos 3'.
	aStack push: 'fiuba'.
	
	aSentenceFinder := SentenceFinderByPrefix new.

	self assert:((aSentenceFinder find: 'de' in: aStack) isEmpty)	.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/14/2022 17:21:35'!
test08afterPopingAFoundElementTheListOfMatchesIsEmptyWhenFindingItAgain
	| aStack aSentenceFinder firstMatches secondMatches |
	aStack := OOStack new.
	aStack push: 'winter is coming'.
	aStack push: 'winning is everything'.
	aStack push: 'The winds of Winter'.
	aStack push: 'Winter is here'.
	
	aSentenceFinder := SentenceFinderByPrefix new.
	firstMatches := aSentenceFinder find: 'Wint' in: aStack.
	aStack pop.
	secondMatches := aSentenceFinder find: 'Wint' in: aStack.
	self assert:( firstMatches first =  'Winter is here' and: secondMatches isEmpty)	.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefixTest class' category: 'Stack-Exercise'!
SentenceFinderByPrefixTest class
	instanceVariableNames: 'temporary'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'elements maxSize'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
!OOStack commentStamp: '<historical>' prior: 0!
ver status!


!OOStack methodsFor: 'initialization' stamp: 'algo3 5/14/2022 22:43:39'!
initialize
	elements := OrderedCollection new.
	maxSize := nil.! !


!OOStack methodsFor: 'stack operations' stamp: 'va 5/10/2022 20:37:26'!
isEmpty
	^ elements size = 0.! !

!OOStack methodsFor: 'stack operations' stamp: 'algo3 5/14/2022 22:44:46'!
pop
	"|pushedElement|
	
	pushedElement := status popFrom: self.
	status := (StackState subclasses detect: [:aStatus| aStatus canBeAStatusOf: self]) new.
	
	^pushedElement."
	
	^((StackState actualStateOf: self) new) popFrom: self.! !

!OOStack methodsFor: 'stack operations' stamp: 'algo3 5/14/2022 22:39:32'!
push: anElement
	
	((StackState actualStateOf: self) new) push: anElement in: self.
	! !

!OOStack methodsFor: 'stack operations' stamp: 'algo3 5/14/2022 22:45:17'!
top
	^((StackState actualStateOf: self) new) topOf:self.
! !


!OOStack methodsFor: 'stack operations - error' stamp: 'va 5/14/2022 15:00:47'!
canNotPopWhenEmpty
	^ self error: self class stackEmptyErrorDescription.! !

!OOStack methodsFor: 'stack operations - error' stamp: 'va 5/14/2022 23:54:40'!
canNotPushWhenFull
	self error: self class stackPushInAFullStackErrorDescription.! !

!OOStack methodsFor: 'stack operations - error' stamp: 'va 5/14/2022 15:00:57'!
canNotTopWhenEmpty
	^ self error: self class stackEmptyErrorDescription.! !


!OOStack methodsFor: 'accesing' stamp: 'vALENKPA 5/12/2022 17:11:40'!
elements
	^elements.! !

!OOStack methodsFor: 'accesing' stamp: 'algo3 5/14/2022 22:15:09'!
maxSize
	^maxSize.! !

!OOStack methodsFor: 'accesing' stamp: 'va 5/10/2022 21:29:39'!
size
	^elements size.! !


!OOStack methodsFor: 'private' stamp: 'va 5/14/2022 14:56:00'!
popWhenNotEmpty
		^ elements removeFirst.! !

!OOStack methodsFor: 'private' stamp: 'algo3 5/14/2022 22:33:17'!
pushWhenNotFull: anElement
	^elements addFirst: anElement.! !

!OOStack methodsFor: 'private' stamp: 'va 5/14/2022 23:17:00'!
setLimit: sizeLimit
	maxSize := sizeLimit.! !

!OOStack methodsFor: 'private' stamp: 'va 5/14/2022 14:54:55'!
topWhenNotEmpty
	^elements first.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'va 5/14/2022 23:44:19'!
newWithLimit: maxSize
	^((self new initialize) setLimit: maxSize).
	
	! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'algo3 5/14/2022 22:22:57'!
stackPushInAFullStackErrorDescription
	^'Error no se puede pushear en un stack limitado lleno'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'va 5/14/2022 23:27:48'!
checkIfPrefixIsValid: aPrefix

	((aPrefix = '') or: (aPrefix includesSubString: ' ')) ifTrue: [^self error: self class invalidPrefixError].
! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'va 5/14/2022 23:28:36'!
find: aPrefix in: aStack
	| auxiliarStack matchesCollection stackSize|.
	
	self checkIfPrefixIsValid: aPrefix.
		
	auxiliarStack := OOStack new.
	matchesCollection := OrderedCollection new.
	stackSize := aStack size.

	stackSize timesRepeat: [
		
			auxiliarStack push: aStack pop.
			(auxiliarStack top beginsWith: aPrefix) ifTrue: [ matchesCollection add: auxiliarStack top]. 
		].
	
	stackSize timesRepeat: [aStack push: auxiliarStack  pop.].
	
	^matchesCollection.
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'algo3 5/14/2022 15:30:36'!
invalidPrefixError
	^'El prefijo no puede contener espacios vacios ni ser vacio'.! !


!classDefinition: #StackState category: 'Stack-Exercise'!
Object subclass: #StackState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackState methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 16:56:50'!
popFrom: aStack
	self subclassResponsibility.! !

!StackState methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 17:03:54'!
topOf: aStack
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackState class' category: 'Stack-Exercise'!
StackState class
	instanceVariableNames: ''!

!StackState class methodsFor: 'as yet unclassified' stamp: 'algo3 5/14/2022 22:50:41'!
actualStateOf: aStack
	^(StackState subclasses detect: [:aStatus| aStatus canBeAStatusOf: aStack]).! !


!classDefinition: #Empty category: 'Stack-Exercise'!
StackState subclass: #Empty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Empty methodsFor: 'stack operations' stamp: 'va 5/14/2022 15:00:28'!
popFrom: aStack
	^ aStack canNotPopWhenEmpty.! !

!Empty methodsFor: 'stack operations' stamp: 'algo3 5/14/2022 22:32:16'!
push: anElement in: aStack
	^ aStack pushWhenNotFull: anElement.! !

!Empty methodsFor: 'stack operations' stamp: 'vALENKPA 5/12/2022 17:04:32'!
topOf: aStack
	^ aStack error: aStack class stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empty class' category: 'Stack-Exercise'!
Empty class
	instanceVariableNames: ''!

!Empty class methodsFor: 'state check' stamp: 'va 5/14/2022 17:08:06'!
canBeAStatusOf: aStack
	^aStack isEmpty.! !


!classDefinition: #Full category: 'Stack-Exercise'!
StackState subclass: #Full
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Full methodsFor: 'stack operations' stamp: 'algo3 5/14/2022 22:23:56'!
push: anElement in: aStack
	^aStack canNotPushWhenFull.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Full class' category: 'Stack-Exercise'!
Full class
	instanceVariableNames: ''!

!Full class methodsFor: 'state check' stamp: 'algo3 5/14/2022 22:14:55'!
canBeAStatusOf: aStack
	^aStack size = aStack maxSize.! !


!classDefinition: #NotEmpty category: 'Stack-Exercise'!
StackState subclass: #NotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NotEmpty methodsFor: 'stack operations' stamp: 'va 5/14/2022 15:02:07'!
popFrom: aStack
	^aStack popWhenNotEmpty.! !

!NotEmpty methodsFor: 'stack operations' stamp: 'algo3 5/14/2022 22:32:23'!
push: anElement in: aStack
	^ aStack pushWhenNotFull: anElement.! !

!NotEmpty methodsFor: 'stack operations' stamp: 'va 5/14/2022 14:54:30'!
topOf: aStack
	^aStack topWhenNotEmpty.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NotEmpty class' category: 'Stack-Exercise'!
NotEmpty class
	instanceVariableNames: ''!

!NotEmpty class methodsFor: 'state check' stamp: 'va 5/14/2022 17:08:08'!
canBeAStatusOf: aStack
	^aStack isEmpty not.! !
