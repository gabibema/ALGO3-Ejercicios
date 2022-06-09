!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'firstAccount secondAccount portfolioWithAnAccount portfolioWithAnEmptyPortfolio emptyPortfolio portfolioWithAPortfolioThatHasAnAccount portfolioWithAnAccountAndAPortfolioThatHasAnAccount portfolioWithAnAccountCopy'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 17:04:29'!
setUp
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	emptyPortfolio  _ Portfolio new.
	portfolioWithAnAccount _ Portfolio with: firstAccount.
	portfolioWithAnAccountCopy _ Portfolio  with: firstAccount.
	portfolioWithAnEmptyPortfolio _ Portfolio with: emptyPortfolio.
	portfolioWithAPortfolioThatHasAnAccount  _ Portfolio with: portfolioWithAnAccount .
	portfolioWithAnAccountAndAPortfolioThatHasAnAccount  _ (Portfolio with: portfolioWithAnAccount)add:secondAccount.
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:36:29'!
test01PortfolioHasZeroAsBalanceWhenCreatedWithAnEmptyAccount
	self assert: portfolioWithAnAccount balance equals: 0 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:37:18'!
test02DepositInAnAccountIncreasesBalanceOnThePortfolio
	Deposit register: 10 * peso on: firstAccount .

	
	self assert: portfolioWithAnAccount balance equals: 10 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:37:44'!
test03PortfolioDoesNotHaveAnAccountThatRegisteredASpecificTransaction
	| transaction |
	transaction _ Deposit for: 20*peso.
	
	self deny: (portfolioWithAnAccount hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:38:04'!
test04PortfolioHasAnAccountThatRegisteredASpecificTransaction
	|transaction|
	transaction _ Deposit register: 20*peso on: firstAccount .
	
	self assert: (portfolioWithAnAccount hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:38:30'!
test05PortfolioHasNoTransactionsWhenAnyAccountRegisteredATransaction
	self assert: portfolioWithAnAccount transactions isEmpty.! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:38:46'!
test06PortfolioHasATransactionWhenAnAccountRegisteredATransaction
	Deposit register: 20*peso on: firstAccount .
	
	self assert: (portfolioWithAnAccount transactions size) equals: 1.! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:41:27'!
test07PortfolioBalanceIsZeroWhenContainingAnEmptyPortfolio
	self assert: portfolioWithAnEmptyPortfolio balance equals: 0 * peso.! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:42:40'!
test08DepositInAnAccountContainedInAPortfolioIncreasesBalanceOnTheOtherPortfolio
	emptyPortfolio add: firstAccount .
	Deposit register: 1000*peso  on: firstAccount .
	
	self assert: portfolioWithAnEmptyPortfolio balance equals: 1000 * peso. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:43:40'!
test09ATransactionMadeToAnAccountContainedInAPortfolioIsRegisteredInTheOtherPortfolio
	| transaction |
	emptyPortfolio add: secondAccount .
	portfolioWithAnEmptyPortfolio add: firstAccount .
	
	transaction _ Withdraw register: 1000*peso  on: firstAccount .
	
	self assert: (portfolioWithAnEmptyPortfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:51:48'!
test10ATransactionMadeToAnAccountContainedInAPortfolioIncreasesTheTotalTransactionsOfTheOtherOne
	
	Deposit register: 1000*peso  on: firstAccount .
	
	self assert: (portfolioWithAPortfolioThatHasAnAccount transactions size) equals: 1.! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:50:52'!
test11TransactionsMadeToAccountsContainedInPortfoliosIncreasesTheTotalTransactionsOfThePortfolio
	
	Deposit register: 1000*peso  on: firstAccount .
	Deposit register: 1000*peso  on: firstAccount .
	Deposit register: 1000*peso  on: firstAccount .
	Deposit register: 1000*peso  on: secondAccount .
	
	self assert: (portfolioWithAnAccountAndAPortfolioThatHasAnAccount transactions size) equals: 4.! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:53:29'!
test12PortfolioCanNotAddAnAlreadyAddedAccount
	self should: [portfolioWithAnAccount add: firstAccount ] 
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddAnAlreadyAddedAccountErrorDescription].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:54:43'!
test13PortfolioCanNotAddAnAccountThatIsAlreadyInAnAddedPortfolio
	self should: [portfolioWithAPortfolioThatHasAnAccount add: firstAccount] 
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddAnAlreadyAddedAccountErrorDescription].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 16:55:06'!
test14PortfolioCanNotAddItself
	self should: [emptyPortfolio add: emptyPortfolio] 
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddAnAlreadyAddedAccountErrorDescription].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 17:03:12'!
test15PortfolioCanNotAddAnAccountThatHasBeenAddedToAFather
	portfolioWithAnEmptyPortfolio add: firstAccount.
	
	self should: [emptyPortfolio add: firstAccount]
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddAnAccountThatHasBeenAddedToAFatherErrorDescription ].
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 17:04:34'!
test16PortfolioCanNotAddPorfolioWithAnAccountThatIsAlreadyInThePortfolio
	self should: [ portfolioWithAnAccountCopy add: portfolioWithAnAccount ]
	      raise: Error
	      withExceptionDo: [:anError| self assert: anError messageText equals: Portfolio canNotAddPorfolioWithAnAccountThatIsAlreadyInThePortfolioErrorDescription ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'firstAccount secondAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/5/2022 22:09:28'!
setUp
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.! !

!TransferTest methodsFor: 'tests' stamp: 'algo3 6/9/2022 17:12:43'!
test01TransferExtractsFromAnAccountAndItsBalanceIsZero
	|valueOfTransfer|
	valueOfTransfer _ 50 * peso.
	Transfer from: firstAccount to: secondAccount value: valueOfTransfer.
	
	self assert: firstAccount balance equals: valueOfTransfer negated.

	
	! !

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/8/2022 19:52:10'!
test02TransferDepositsInAnAccountAndItsBalanceIsTheValueOfTransfer
	|valueOfTransfer|
	
	valueOfTransfer _ 50 * peso.
	
	Deposit register: valueOfTransfer on: firstAccount .
	Transfer from: firstAccount to: secondAccount value: valueOfTransfer.
	
	self assert: secondAccount balance equals: valueOfTransfer .
! !

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/8/2022 19:32:08'!
test03TransferKnowsTheValueOfTheTransfer
	|valueOfTransfer transfer|

	valueOfTransfer _ 10 * peso.
	
	Deposit register: valueOfTransfer on: firstAccount .
	transfer _ Transfer from: firstAccount to: secondAccount value: valueOfTransfer.
	self assert: transfer value equals: valueOfTransfer. 
	
! !

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/9/2022 10:30:31'!
test04TransferChangesTheBalanceOfAnAccountIntoANegativeOneIfTheValueOfTransferIsHigherThanItsBalance
	|valueOfTransfer transfer|
	
	valueOfTransfer _ 40 * peso.
	
	Deposit register: (valueOfTransfer/2) on: firstAccount .
	transfer _ Transfer from: firstAccount to: secondAccount value: valueOfTransfer.
	
	self assert: firstAccount balance equals: (-20*peso). 
	self assert: secondAccount balance equals: valueOfTransfer.
	self assert: transfer value equals: valueOfTransfer.
	
	! !

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/8/2022 19:39:51'!
test05TransferHasADepositLegWichValueIsTheValueOfTransfer
	|valueOfTransfer transfer|

	valueOfTransfer _ 40 * peso.
	
	Deposit register: valueOfTransfer on: firstAccount .
	transfer _ Transfer from: firstAccount to: secondAccount value: valueOfTransfer. 
	
	self assert: (transfer depositLeg valueIsEqualTo: valueOfTransfer). 
	! !

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/8/2022 19:43:44'!
test06TransferHasAWithdrawLegWichValueIsTheValueOfTransfer
	|valueOfTransfer transfer|
	
	valueOfTransfer _ 40* peso.
	
	Deposit register: valueOfTransfer on: firstAccount .
	transfer _ Transfer from: firstAccount to: secondAccount value: valueOfTransfer.
	
	self assert: (transfer withdrawLeg valueIsEqualTo: valueOfTransfer).
	! !

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/8/2022 20:02:29'!
test07TransferDepositLegKnowsItsCounterPart 
	|valueOfTransfer transfer|

	valueOfTransfer _ 40 * peso.
	
	Deposit register: valueOfTransfer on: firstAccount .
	transfer _ Transfer from: firstAccount to: secondAccount value: valueOfTransfer. 
	
	self assert: (transfer depositLeg counterpartIn: transfer) equals: transfer withdrawLeg.
	! !

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/8/2022 20:02:43'!
test08TransferWithdrawLegKnowsItsCounterPart
	|valueOfTransfer transfer|

	valueOfTransfer _ 18 * peso.
	
	Deposit register: valueOfTransfer/2 on: firstAccount .
	transfer _ Transfer from: firstAccount to: secondAccount value: 2*valueOfTransfer. 
	
	self assert:  (transfer withdrawLeg counterpartIn: transfer) equals: transfer depositLeg.! !

!TransferTest methodsFor: 'tests' stamp: 'valentina 6/8/2022 19:49:49'!
test09CanNotMakeATransferWithANegativeValue
	|valueOfTransfer |

	valueOfTransfer _ 10 * peso.
	
	Deposit register: valueOfTransfer on: firstAccount .
	
	self should: [Transfer from: firstAccount to: secondAccount value: valueOfTransfer negated.] 
		raise: Error
		withExceptionDo: [:anError| self assert: anError messageText equals: Transfer invalidTransferValueErrorDescription].
	! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Account
	instanceVariableNames: 'fathers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Account methodsFor: 'main protocol' stamp: 'algo3 6/9/2022 17:19:45'!
balance
	self subclassResponsibility ! !


!Account methodsFor: 'inicialization' stamp: 'algo3 6/9/2022 17:20:44'!
initialize
	self subclassResponsibility ! !


!Account methodsFor: 'private' stamp: 'algo3 6/9/2022 17:18:10'!
accounts
	! !

!Account methodsFor: 'private' stamp: 'algo3 6/9/2022 17:15:46'!
addFather: aNewFatherPortfolio
	fathers add: aNewFatherPortfolio.! !

!Account methodsFor: 'private' stamp: 'algo3 6/9/2022 17:19:17'!
hasRegistered: aTransaction
	self subclassResponsibility.! !

!Account methodsFor: 'private' stamp: 'algo3 6/9/2022 17:17:17'!
isComposedBy: anAccount
	self subclassResponsibility.! !

!Account methodsFor: 'private' stamp: 'algo3 6/9/2022 17:17:31'!
isComposedByAnyOf: anAccount
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'initialization' stamp: 'algo3 6/8/2022 22:59:06'!
initialize
	accounts _ OrderedCollection new.
	fathers _ OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'algo3 6/8/2022 23:01:11'!
initializeWith: anAccount
	accounts _ OrderedCollection with: anAccount.
	anAccount addFather: self.! !


!Portfolio methodsFor: 'verify' stamp: 'valentina 6/9/2022 14:51:42'!
verifyIfAccountIsAlreadyAdded: anAccountToBeChecked

	self verifyIfAnAccountIsComposedBy: anAccountToBeChecked .
	self verifyIfAnyFatherHasAnAccount: anAccountToBeChecked.
	self verifyIfPortolioAccountsAreAlreadyAdded: anAccountToBeChecked.
	

	
	! !

!Portfolio methodsFor: 'verify' stamp: 'valentina 6/9/2022 14:51:42'!
verifyIfAnAccountIsComposedBy: anAccountToBeChecked
	(self isComposedBy: anAccountToBeChecked) ifTrue: [^self error: self class canNotAddAnAlreadyAddedAccountErrorDescription]! !

!Portfolio methodsFor: 'verify' stamp: 'valentina 6/9/2022 14:51:33'!
verifyIfAnyFatherHasAnAccount: anAccountToBeChecked
	(self fathersHaveAnAccount: anAccountToBeChecked) ifTrue:[^self error: self class canNotAddAnAccountThatHasBeenAddedToAFatherErrorDescription] ! !

!Portfolio methodsFor: 'verify' stamp: 'valentina 6/9/2022 14:51:23'!
verifyIfPortolioAccountsAreAlreadyAdded: anAccountToBeChecked
	^ (self isComposedByAnyOf: anAccountToBeChecked accounts) ifTrue: [self error: self class canNotAddPorfolioWithAnAccountThatIsAlreadyInThePortfolioErrorDescription].! !


!Portfolio methodsFor: 'main protocol' stamp: 'valentina 6/9/2022 14:51:11'!
add: anAccount
	self verifyIfAccountIsAlreadyAdded: anAccount.
	accounts add: anAccount.
	anAccount addFather: self.! !

!Portfolio methodsFor: 'main protocol' stamp: 'algo3 6/7/2022 16:05:11'!
balance
	^accounts sum: [:account | account balance] ifEmpty: [^0*peso].! !

!Portfolio methodsFor: 'main protocol' stamp: 'algo3 6/7/2022 16:17:27'!
hasRegistered: aTransaction
	accounts detect: [:account| account hasRegistered: aTransaction] ifFound:[:account| ^true] ifNone:[ ^false].! !

!Portfolio methodsFor: 'main protocol' stamp: 'algo3 6/7/2022 17:39:50'!
transactions	
	| transactions |
	transactions _ OrderedCollection new.

	accounts  do: [:account | transactions addAll: account transactions].
	
	^transactions.! !


!Portfolio methodsFor: 'private' stamp: 'valentina 6/9/2022 09:49:37'!
accounts
	^accounts ! !

!Portfolio methodsFor: 'private' stamp: 'valentina 6/9/2022 09:27:29'!
fathersHaveAnAccount: anAccountToBeChecked
	^fathers anySatisfy: [:father | father isComposedBy: anAccountToBeChecked].! !

!Portfolio methodsFor: 'private' stamp: 'valentina 6/9/2022 14:48:38'!
isComposedBy: anAccountToBeChecked
	^(self = anAccountToBeChecked ) or: [accounts anySatisfy: [:account | account isComposedBy: anAccountToBeChecked]].! !

!Portfolio methodsFor: 'private' stamp: 'valentina 6/9/2022 09:50:46'!
isComposedByAnyOf: aGroupOfAccounts
	^aGroupOfAccounts anySatisfy: [:anAccount | self isComposedBy: anAccount ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'valentina 6/9/2022 10:14:53'!
canNotAddAnAccountThatHasBeenAddedToAFatherErrorDescription
	^'Account has already been added in a father'.! !

!Portfolio class methodsFor: 'error' stamp: 'valentina 6/9/2022 09:38:51'!
canNotAddAnAlreadyAddedAccountErrorDescription
	^'The account is already in the portfolio'.! !

!Portfolio class methodsFor: 'error' stamp: 'valentina 6/9/2022 09:38:42'!
canNotAddPorfolioWithAnAccountThatIsAlreadyInThePortfolioErrorDescription
	^'The account is already in the portfolio'.! !


!Portfolio class methodsFor: 'instance creation' stamp: 'valentina 6/8/2022 19:56:08'!
with: anAccount

	^self new initializeWith: anAccount.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'algo3 6/8/2022 23:03:45'!
initialize

	transactions _ OrderedCollection new.
	fathers _ OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'portfolio operations' stamp: 'valentina 6/9/2022 09:57:42'!
anySatisfy: anAccount
	^false! !

!ReceptiveAccount methodsFor: 'portfolio operations' stamp: 'valentina 6/9/2022 09:25:05'!
isComposedBy: anAccountToBeChecked
	^self = anAccountToBeChecked.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'A 6/6/2022 21:39:10'!
balance

	^transactions sum: [ :aTransaction | aTransaction valueForBalance ] ifEmpty: [ 0 * peso ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'valentina 6/5/2022 19:47:49'!
valueForBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'valentina 6/5/2022 21:52:29'!
valueIsEqualTo: aValue
	^self value = aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'valentina 6/5/2022 21:27:37'!
value
	^ value! !

!Deposit methodsFor: 'value' stamp: 'valentina 6/5/2022 19:48:10'!
valueForBalance
	^self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'A 6/6/2022 20:58:59'!
initializeFor: aValue

	value := aValue ! !


!TransferDeposit methodsFor: 'value' stamp: 'A 6/6/2022 21:12:13'!
valueIsEqualTo: aValue
	^value = aValue.! !


!TransferDeposit methodsFor: 'private' stamp: 'A 6/6/2022 21:11:55'!
value
	^value.! !


!TransferDeposit methodsFor: 'counter part' stamp: 'A 6/6/2022 20:53:50'!
counterpartIn: aTransfer
	^aTransfer withdrawLeg.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'A 6/6/2022 20:58:00'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'private' stamp: 'A 6/6/2022 21:12:39'!
value
	^value.! !


!TransferWithdraw methodsFor: 'counter part' stamp: 'A 6/6/2022 20:57:35'!
counterpartIn: aTransfer
	^aTransfer depositLeg.! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'A 6/6/2022 20:59:05'!
initializeFor: aValue

	value := aValue ! !


!TransferWithdraw methodsFor: 'value' stamp: 'A 6/6/2022 21:12:32'!
valueIsEqualTo: aValue
	^value = aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'A 6/6/2022 20:58:05'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

!Withdraw methodsFor: 'value' stamp: 'valentina 6/5/2022 19:49:53'!
valueForBalance
	^ self value negated.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value depositLeg withdrawLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'A 6/6/2022 21:04:44'!
initializeFor: aValue
	value _ aValue.
	depositLeg _ TransferDeposit for: aValue.
	withdrawLeg _ TransferWithdraw for: aValue.! !


!Transfer methodsFor: 'value' stamp: 'valentina 6/5/2022 22:03:48'!
value
	^value! !


!Transfer methodsFor: 'legs' stamp: 'valentina 6/5/2022 21:50:17'!
depositLeg
	^depositLeg ! !

!Transfer methodsFor: 'legs' stamp: 'valentina 6/5/2022 21:50:43'!
withdrawLeg
	^withdrawLeg ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'valentina 6/9/2022 10:29:54'!
for: aValue
	^self new initializeFor: aValue. ! !

!Transfer class methodsFor: 'instance creation' stamp: 'valentina 6/9/2022 14:37:29'!
from: aReceptiveAccount1 to: aReceptiveAccount2 value: aValue
	self checkTransferValue: aValue.

	Deposit register: aValue on: aReceptiveAccount2.
	Withdraw register: aValue on: aReceptiveAccount1. 
	
	^self for: aValue.! !


!Transfer class methodsFor: 'checks-errors' stamp: 'A 6/6/2022 21:21:08'!
checkTransferValue: aValue
	(aValue <= 0) ifTrue: [^self error: self invalidTransferValueErrorDescription].! !

!Transfer class methodsFor: 'checks-errors' stamp: 'A 6/6/2022 21:19:01'!
invalidTransferValueErrorDescription
	^'Can not transfer a negative or zero amount of money'.! !
