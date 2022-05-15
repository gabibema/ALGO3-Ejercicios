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

!OOStackTest methodsFor: 'test' stamp: 'va 5/15/2022 18:39:56'!
test11CanNotCreateALimitedStackWithANoIntegerSize
	self createALimitedStackAndCatchExceptionWithInvalidSize: 'a'.
	! !

!OOStackTest methodsFor: 'test' stamp: 'va 5/15/2022 18:40:16'!
test12CanNotCreateALimitedStackWithANegativeSize
	self createALimitedStackAndCatchExceptionWithInvalidSize: -4.! !

!OOStackTest methodsFor: 'test' stamp: 'algo3 5/15/2022 17:15:07'!
test13ALimitedStackCanBeCreatedSuccessfully
	|aStack|
	aStack := OOStack newWithLimit: 3.
	self deny: aStack = nil.
	
	
	! !

!OOStackTest methodsFor: 'test' stamp: 'algo3 5/15/2022 17:14:58'!
test14CanNotPushMoreElementsWhenTheStackIsFull
	|aStack|
	aStack := OOStack newWithLimit: 2.
	aStack push: 1.
	aStack push: 2.
	
	[aStack push: 3. self fail] 
		on: Error
		do: [:anError | self assert: anError messageText = OOStack stackPushInAFullStackErrorDescription].
! !


!OOStackTest methodsFor: 'private' stamp: 'va 5/15/2022 18:39:33'!
createALimitedStackAndCatchExceptionWithInvalidSize: size
	
	[OOStack newWithLimit: size. self fail] 
		on: Error
		do: [:anError| self assert: anError messageText equals: OOStack stackSizeLimitErrorDescription.]
	
	
	! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'stack sentenceFinder expectedMatches'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'va 5/15/2022 18:47:59'!
setUp 

	stack := OOStack new.
	sentenceFinder := SentenceFinderByPrefix new.
	expectedMatches := OrderedCollection new.! !


!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/15/2022 19:02:38'!
test01givenAnEmptyStackTheListOfMatchesIsEmpty

	self assert: ((sentenceFinder find: 'hola' in: stack) isEmpty)	.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/15/2022 18:25:47'!
test02canNotFindWithAPrefixThatIncludesSpaces
	
	[sentenceFinder find: 'win ' in: stack. self fail] 
		on: Error 
		do: [:anError| self assert: anError messageText = SentenceFinderByPrefix invalidPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/15/2022 18:26:02'!
test03canNotFindWithAnEmptyPrefix
	
	[sentenceFinder find: '' in: stack. self fail] 
		on: Error
		do: [:anError| self assert: anError messageText = SentenceFinderByPrefix invalidPrefixError].! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/15/2022 18:47:59'!
test04theSentenceFinderIsCaseSensitive
	| matches |

	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	matches := sentenceFinder find: 'Wint' in: stack.
	expectedMatches add: 'Winter is here'.
	self assert:( matches includesAllOf: expectedMatches )	.
	
	
	
! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/15/2022 18:27:20'!
test05afterFindingMatchesTheOriginalStackRemainsUnchanged

	stack push: 'winter'.
	stack push: 'summer'.
	
	sentenceFinder find: 'wint' in: stack.
	
	self assert:(stack pop = 'summer' and: stack pop = 'winter')	.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/15/2022 18:47:59'!
test06givenAStackWithRepeatedElementsTheListOfMatchesHaveThemAll
	|  matches |

	stack push: 'winter is coming'.
	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'winter is coming'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	matches := sentenceFinder find: 'wint' in: stack.
	
	3 timesRepeat: [expectedMatches add: 'winter is coming'].
	
	self assert: (matches includesAllOf: expectedMatches)	.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/15/2022 19:02:18'!
test07theListOfMatchesIsEmptyIfThereAreNoMatchesWithThePrefix

	stack push: 'algoritmos 3'.
	stack push: 'fiuba'.

	self assert: ((sentenceFinder find: 'de' in: stack) isEmpty)	.
	! !

!SentenceFinderByPrefixTest methodsFor: 'test' stamp: 'va 5/15/2022 19:01:50'!
test08afterPopingAFoundElementTheListOfMatchesIsEmptyWhenFindingItAgain
	|  firstMatches secondMatches |

	stack push: 'winter is coming'.
	stack push: 'winning is everything'.
	stack push: 'The winds of Winter'.
	stack push: 'Winter is here'.
	
	firstMatches := sentenceFinder find: 'Wint' in: stack.
	stack pop.
	secondMatches := sentenceFinder find: 'Wint' in: stack.
	self assert: (firstMatches first =  'Winter is here' and: secondMatches isEmpty)	.
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

!OOStack methodsFor: 'initialization' stamp: 'algo3 5/14/2022 22:43:39'!
initialize
	elements := OrderedCollection new.
	maxSize := nil.! !


!OOStack methodsFor: 'stack operations' stamp: 'va 5/15/2022 19:05:10'!
isEmpty
	^elements size = 0.! !

!OOStack methodsFor: 'stack operations' stamp: 'va 5/15/2022 19:03:46'!
pop

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


!OOStack methodsFor: 'accesing' stamp: 'algo3 5/14/2022 22:15:09'!
maxSize
	^maxSize.! !

!OOStack methodsFor: 'accesing' stamp: 'va 5/10/2022 21:29:39'!
size
	^elements size.! !


!OOStack methodsFor: 'private' stamp: 'va 5/15/2022 18:11:32'!
checkStackLimit: aLimit
	(aLimit isInteger not) ifTrue: [^self error: self class stackSizeLimitErrorDescription].
	(aLimit < 0) ifTrue: [^self error: self class stackSizeLimitErrorDescription].! !

!OOStack methodsFor: 'private' stamp: 'va 5/15/2022 19:04:56'!
popWhenNotEmpty
	^elements removeFirst.! !

!OOStack methodsFor: 'private' stamp: 'algo3 5/14/2022 22:33:17'!
pushWhenNotFull: anElement
	^elements addFirst: anElement.! !

!OOStack methodsFor: 'private' stamp: 'algo3 5/15/2022 16:58:04'!
setLimit: sizeLimit
	self checkStackLimit: sizeLimit.
	maxSize := sizeLimit.! !

!OOStack methodsFor: 'private' stamp: 'va 5/14/2022 14:54:55'!
topWhenNotEmpty
	^elements first.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'limited stack' stamp: 'va 5/14/2022 23:44:19'!
newWithLimit: maxSize
	^((self new initialize) setLimit: maxSize).
	
	! !


!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'algo3 5/14/2022 22:22:57'!
stackPushInAFullStackErrorDescription
	^'Error no se puede pushear en un stack limitado lleno'! !

!OOStack class methodsFor: 'error descriptions' stamp: 'algo3 5/15/2022 16:58:26'!
stackSizeLimitErrorDescription
	^'Error el límite para el stack debe ser un número positivo'.! !


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

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'algo3 5/15/2022 17:21:09'!
copyElementsFrom: aStack into: anotherStack
	aStack size timesRepeat: [anotherStack push: aStack pop.].
! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'algo3 5/15/2022 17:26:41'!
copyValuesFrom: aStack to: anotherStack andSelect: condition
	| elements |
	elements:= OrderedCollection new.
	
	aStack size timesRepeat: [
		anotherStack push: aStack pop.
		(condition value: anotherStack top) ifTrue: [ elements add: anotherStack top.].
	].
	
	^elements.

	! !

!SentenceFinderByPrefix methodsFor: 'private' stamp: 'algo3 5/15/2022 17:34:24'!
findAllWordsThatBeginsWith: aPrefix in: aStack
	| auxiliarStack |.
	auxiliarStack := OOStack new.

	self copyElementsFrom: aStack into: auxiliarStack.
	^self copyValuesFrom: auxiliarStack to: aStack  andSelect: [:element | element beginsWith: aPrefix].
	! !


!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'algo3 5/15/2022 17:34:48'!
find: aPrefix in: aStack
	
	self checkIfPrefixIsValid: aPrefix.
	^self findAllWordsThatBeginsWith: aPrefix in: aStack 
	
	
	
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

!StackState class methodsFor: 'state detector' stamp: 'algo3 5/14/2022 22:50:41'!
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
