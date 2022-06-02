!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: 'south east west north marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/29/2022 11:49:12'!
setUp
	marsRover _ MarsRover start.

	south _ SouthMarsRoverOrientation new.
	north _ NorthMarsRoverOrientation new.
	west _ WestMarsRoverOrientation new.
	east _ EastMarsRoverOrientation new.

	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/29/2022 11:49:12'!
test01MarsRoverStartsInZeroZeroLookingAtNorth

	self assert: (marsRover currentPosition) equals: 0@0.
	self assert: (marsRover isLookingAtNorth).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/29/2022 11:47:28'!
test02MarsRoverCanStartInASpecifiedPosition
	|marsRiver initialPosition|
	initialPosition _ 0@1.
	marsRiver _ MarsRover startIn: initialPosition.
	
	self assert: marsRiver currentPosition equals: initialPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/29/2022 11:51:01'!
test03MarsRoverCanStartLookingAtASpecificDirection
	|marsRiver|
	marsRiver _ MarsRover startLookingAt:  south.
	
	self assert: (marsRiver isLookingAtSouth).
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/29/2022 11:51:13'!
test04MarsRoverCanStartInASpecificPositionAndDirection
	|marsRiver initialPosition|
	initialPosition _ 1@2.

	marsRiver _ MarsRover startIn: initialPosition lookingAt: east.
	
	self assert: marsRiver currentPosition equals: initialPosition.
	self assert: (marsRiver isLookingAtEast).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/29/2022 11:31:47'!
test05MarsRoverCantStartLookingAtAnInvalidDirection
	|anInvalidCardinalPoint|
	anInvalidCardinalPoint _ $Y.
	
	[MarsRover startLookingAt: anInvalidCardinalPoint. self fail]
		on: Error
		do: [:anError | self assert: anError messageText equals: MarsRover invalidCardinalPoint]. ! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:29:36'!
test06MarsRoverCantExecuteAnInvalidCommand
	self should: [marsRover executeCommandLine: 'o'] 
	      raise: Error
	      withExceptionDo: [:anError | self assert: anError messageText equals: MarsRover invalidMove].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:29:36'!
test07MarsRoverCanMoveForward
	marsRover executeCommandLine: 'f'.
	
	self assert: marsRover currentPosition equals: 0@1.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:29:36'!
test08MarsRoverCanMoveBackward
	marsRover executeCommandLine: 'b'.
	
	self assert: marsRover currentPosition equals: 0@-1.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:29:37'!
test09MarsRoverCanRotate90DegreesToTheRight
	marsRover executeCommandLine: 'r'.
	
	self assert: (marsRover isLookingAtEast).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:29:37'!
test10MarsRoverCanRotate90DegreesToTheLeft
	marsRover executeCommandLine: 'l'.
	
	self assert: (marsRover isLookingAtWest).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:32:23'!
test11MarsRoverCanMoveBackwardTwoTimes
	marsRover executeCommandLine: 'bb'.
	
	self assert: marsRover currentPosition equals: 0@-2.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:32:54'!
test12MarsRoverCanMoveForwardTwoTimes
	marsRover executeCommandLine: 'ff'.
	
	self assert: marsRover currentPosition equals: 0@2.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:33:36'!
test13MarsRoverCanRotate90DegreesToTheRightTwoTimes
	marsRover executeCommandLine: 'rr'.
	
	self assert: (marsRover isLookingAtSouth).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:34:03'!
test14MarsRoverCanRotate90DegreesToTheLeftTwoTimes
	marsRover executeCommandLine: 'll'.
	
	self assert: (marsRover isLookingAtSouth).! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:32:49'!
test15MarsRoverCanExecuteAGroupOfCommands
	|marsRiver  commandLine|
	commandLine _ 'flrbbrrbbbfff'.
	marsRiver _ MarsRover  start.
	marsRiver executeCommandLine: commandLine.

	self assert: (marsRiver isLookingAtSouth).
	self assert: marsRiver currentPosition equals: 0@-1.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:32:41'!
test16MarsRoverCanNotExecuteAnEmptyCommand
	|emptyCommandLine|
	emptyCommandLine _ ''.

	self should: [marsRover executeCommandLine: emptyCommandLine]
	      raise: Error
	      withExceptionDo: [:anError | self assert: anError messageText equals: MarsRover invalidMove].! !

!MarsRoverTest methodsFor: 'testing' stamp: 'algo3 5/30/2022 23:32:32'!
test17MarsRoverExecutesACommandLineWhileItIsValid
	|commandLine|
	commandLine _ 'fxdbb'.
	self  should: [ marsRover executeCommandLine: commandLine.]
		raise: Error
		withExceptionDo: [: anError| self assert:anError messageText equals: MarsRover invalidMove.].
		
      self assert: (marsRover isLookingAtNorth).
      self assert: marsRover currentPosition equals: 0@1.
		



! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'accessing' stamp: 'VA 5/28/2022 09:36:32'!
currentPosition
	^position.! !


!MarsRover methodsFor: 'operations' stamp: 'algo3 5/30/2022 23:30:13'!
executeCommand: aCommand
	(aCommand = $f) ifTrue: [position _ position  + cardinalPoint forwardPosition].
	(aCommand = $b) ifTrue: [position _ position  + cardinalPoint backwardPosition].
	(aCommand = $r) ifTrue: [cardinalPoint _ cardinalPoint rightOrientation].
	(aCommand = $l) ifTrue: [cardinalPoint _ cardinalPoint leftOrientation]. ! !

!MarsRover methodsFor: 'operations' stamp: 'algo3 5/30/2022 23:30:35'!
executeCommandLine: aCommandLine 
	
	self checkIsAValidCommandLine: aCommandLine .
	
	aCommandLine do:[ :aCommand | 
		self checkIsAValidCommand: aCommand.
		self executeCommand: aCommand.
	]


	
		

	
	! !


!MarsRover methodsFor: 'direction' stamp: 'algo3 5/29/2022 09:53:12'!
isLookingAtEast
	^cardinalPoint isEast.! !

!MarsRover methodsFor: 'direction' stamp: 'algo3 5/29/2022 09:52:36'!
isLookingAtNorth
	^cardinalPoint isNorth.! !

!MarsRover methodsFor: 'direction' stamp: 'algo3 5/29/2022 09:52:57'!
isLookingAtSouth
	^cardinalPoint isSouth.! !

!MarsRover methodsFor: 'direction' stamp: 'algo3 5/29/2022 09:53:26'!
isLookingAtWest
	^cardinalPoint isWest.! !


!MarsRover methodsFor: 'intialization' stamp: 'VA 5/28/2022 15:27:04'!
initializeIn: anInitialPoint lookingAt: aCardinalPoint

	position _ anInitialPoint.
	cardinalPoint _ aCardinalPoint.! !


!MarsRover methodsFor: 'validation' stamp: 'algo3 5/30/2022 23:26:58'!
checkIsAValidCommand: aCommand
	(self isAValidCommand: aCommand) ifFalse: [self error: self class invalidMove].! !

!MarsRover methodsFor: 'validation' stamp: 'algo3 5/30/2022 23:27:50'!
checkIsAValidCommandLine: aCommandLine
	aCommandLine isEmpty ifTrue: [self error: self class invalidMove].! !

!MarsRover methodsFor: 'validation' stamp: 'algo3 5/29/2022 11:54:20'!
isAValidCommand: aCommand
	^((aCommand = $f) or: (aCommand = $b) or: (aCommand = $l) or: (aCommand = $r)).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'algo3 5/29/2022 11:37:13'!
start

	^self new initializeIn: 0@0 lookingAt: NorthMarsRoverOrientation new.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'algo3 5/29/2022 11:37:13'!
startIn: anInitialPosition 
	
	^self new initializeIn: anInitialPosition lookingAt: NorthMarsRoverOrientation new.! !

!MarsRover class methodsFor: 'instance creation' stamp: 'algo3 5/29/2022 11:34:36'!
startIn: anInitializePoint lookingAt: aCardinalPoint 

	[aCardinalPoint isACardinalPoint]
		on: Error
		do: [self error: self invalidCardinalPoint].
	
	^self new initializeIn: anInitializePoint lookingAt: aCardinalPoint! !

!MarsRover class methodsFor: 'instance creation' stamp: 'VA 5/28/2022 15:25:59'!
startLookingAt: aCardinalPoint

	^self startIn: 0@0 lookingAt: aCardinalPoint.
	! !


!MarsRover class methodsFor: 'error' stamp: 'algo3 5/29/2022 11:56:32'!
invalidCardinalPoint
	^'Invalid cardinal point'.! !

!MarsRover class methodsFor: 'error' stamp: 'algo3 5/29/2022 11:56:38'!
invalidMove
	^'Invalid move'.! !


!classDefinition: #MarsRoverOrientation category: 'MarsRover'!
Object subclass: #MarsRoverOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:38:38'!
backwardPosition
	self subclassResponsibility.! !

!MarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:37'!
forwardPosition
	self subclassResponsibility.! !

!MarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 09:54:07'!
isEast
	^false.! !

!MarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 09:53:51'!
isNorth
	^false.! !

!MarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 09:54:03'!
isSouth
	^false.! !

!MarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 09:54:10'!
isWest
	^false.! !

!MarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:24'!
leftOrientation
	self subclassResponsibility.! !

!MarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:39'!
rightOrientation
	self subclassResponsibility.! !


!MarsRoverOrientation methodsFor: 'validation' stamp: 'algo3 5/29/2022 10:04:11'!
isACardinalPoint
	^true.! !


!classDefinition: #EastMarsRoverOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #EastMarsRoverOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!EastMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:13'!
backwardPosition
	^1@0.! !

!EastMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:37'!
forwardPosition
	^-1@0.! !

!EastMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 09:54:28'!
isEast
	^true.! !

!EastMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:25'!
leftOrientation
	^NorthMarsRoverOrientation new.! !

!EastMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:40'!
rightOrientation
	^SouthMarsRoverOrientation new.! !


!classDefinition: #NorthMarsRoverOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #NorthMarsRoverOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!NorthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:13'!
backwardPosition
	^0@-1! !

!NorthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:38'!
forwardPosition
	^0@1! !

!NorthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 09:54:59'!
isNorth
	^true.! !

!NorthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:25'!
leftOrientation
	^WestMarsRoverOrientation new.! !

!NorthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:40'!
rightOrientation
	^EastMarsRoverOrientation new.! !


!classDefinition: #SouthMarsRoverOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #SouthMarsRoverOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!SouthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:13'!
backwardPosition
	^0@1.! !

!SouthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:38'!
forwardPosition
	^0@-1.! !

!SouthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 09:55:10'!
isSouth
	^true.! !

!SouthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:25'!
leftOrientation
	^EastMarsRoverOrientation new.! !

!SouthMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:40'!
rightOrientation
	^WestMarsRoverOrientation new.! !


!classDefinition: #WestMarsRoverOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #WestMarsRoverOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WestMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:13'!
backwardPosition
	^1@0.! !

!WestMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:39:38'!
forwardPosition
	^-1@0.! !

!WestMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 09:55:23'!
isWest
	^true.! !

!WestMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:25'!
leftOrientation
	^SouthMarsRoverOrientation new.! !

!WestMarsRoverOrientation methodsFor: 'directions' stamp: 'algo3 5/29/2022 11:40:40'!
rightOrientation
	^NorthMarsRoverOrientation new.! !
