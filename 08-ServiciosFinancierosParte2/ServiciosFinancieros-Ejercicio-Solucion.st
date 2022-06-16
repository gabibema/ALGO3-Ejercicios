!classDefinition: #AccountSummaryTest category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'VA 6/12/2022 19:01:37'!
test01SummaryOfAnEmptyAccountIsZeroAsBalance
	|accountWithoutTransactions expectedSummary|
	accountWithoutTransactions  _ ReceptiveAccount new.
	expectedSummary _ OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: (AccountSummary of: accountWithoutTransactions)  equals: expectedSummary.
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'VA 6/12/2022 19:03:24'!
test02SummaryOfAnAccountWithADepositIsTheDepositValueAndItsBalance
	|accountWithADeposit expectedSummary|
	accountWithADeposit _ ReceptiveAccount new.
	Deposit register: 100 * peso on: accountWithADeposit.
	expectedSummary  _ OrderedCollection newFrom: {'Depósito por 100 pesos'.'Balance = 100 pesos'}.
	self assert: (AccountSummary of: accountWithADeposit) equals: expectedSummary.
	
	
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'VA 6/12/2022 19:05:00'!
test03SummaryOfAnAccountWithAWithdrawitIsTheWithdrawValueAndItsBalance
	|accountWithAWithdraw expectedSummary|
	accountWithAWithdraw _ ReceptiveAccount new.
	Withdraw register: 50 * peso on: accountWithAWithdraw.
	expectedSummary  _ OrderedCollection newFrom: {'Extracción por 50 pesos'.'Balance = -50 pesos'}.
	self assert: (AccountSummary of: accountWithAWithdraw) equals: expectedSummary.
	
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'VA 6/12/2022 19:05:49'!
test04SummaryOfAnAccountWithAWithdrawLegIsTheWithdrawLegValueAndItsBalance
	|accountToTransfer expectedSummary accountTransfered|
	accountToTransfer _ ReceptiveAccount new.
	accountTransfered _ ReceptiveAccount new.
	expectedSummary  _ OrderedCollection newFrom: {'Salida por transferencia de 20 pesos'.'Balance = -20 pesos'}.
	Transfer amount: 20 * peso from: accountToTransfer to: accountTransfered.
	self assert: (AccountSummary of: accountToTransfer) equals: expectedSummary.
	
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'VA 6/12/2022 19:06:29'!
test05SummaryOfAnAccountWithADepositLegIsTheDepositLegValueAndItsBalance
	|accountToTransfer expectedSummary accountTransfered|
	accountToTransfer _ ReceptiveAccount new.
	accountTransfered _ ReceptiveAccount new.
	expectedSummary  _ OrderedCollection newFrom: {'Entrada por transferencia de 30 pesos'.'Balance = 30 pesos'}.
	Transfer amount: 30 * peso from: accountToTransfer to: accountTransfered.
	self assert: (AccountSummary of: accountTransfered ) equals: expectedSummary.
	
! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:30:21'!
test06SummaryOfAnAccountWithDepositWithdrawAndTranfersIsAllItsValuesAndBalance
	|accountWithTransactions expectedSummary secondAccount|
	expectedSummary  _ OrderedCollection newFrom: {'Depósito por 100 pesos'.'Extracción por 50 pesos'.'Salida por transferencia de 20 pesos'.'Entrada por transferencia de 30 pesos'.'Balance = 60 pesos'}.
	accountWithTransactions _ ReceptiveAccount new.
	secondAccount  _ ReceptiveAccount  new.
	
	Deposit register: 100 * peso on: accountWithTransactions.
	Withdraw register: 50* peso on: accountWithTransactions.
	Transfer amount: 20 * peso from: accountWithTransactions to: secondAccount.
	Transfer amount: 30 * peso from: secondAccount to: accountWithTransactions.
	
	self assert: (AccountSummary of: accountWithTransactions) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:31:35'!
test07SummaryOfAnEmptyPortfolioIsZeroAsBalance
	|aPortfolioWithZeroAccounts expectedSummary|
	aPortfolioWithZeroAccounts _ Portfolio new.
	expectedSummary _ OrderedCollection with: 'Balance = 0 pesos'.
	
	self assert: (AccountSummary of: aPortfolioWithZeroAccounts) equals: expectedSummary.! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:32:44'!
test08SummaryOfAPortfolioWithAnAccountThatHasTransactionsIsTheExpectedSummary
	|aPortfolioWithAnAccount anAccount expectedSummary|
	anAccount _ ReceptiveAccount new.
	Deposit register: 10*peso on: anAccount.
	Withdraw register: 5*peso on: anAccount.
	
	aPortfolioWithAnAccount _ Portfolio with: anAccount.
	expectedSummary _ OrderedCollection newFrom: {'Depósito por 10 pesos'.'Extracción por 5 pesos'.'Balance = 5 pesos'}.
	self assert: (AccountSummary of: aPortfolioWithAnAccount) equals: expectedSummary.! !


!classDefinition: #AccountTransferNetTest category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TestCase subclass: #AccountTransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!AccountTransferNetTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:22:34'!
test01TransferNetOfAnEmptyAccountIsZeroPesos
	|account|
	account _ ReceptiveAccount new.
	self assert: (AccountTransferNet of: account) equals: 0*peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:22:34'!
test02TransferNetOfAnAccountWithAWithdrawLegIsTheWithdrawLegValue
	|account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Transfer amount: 20 from: account1 to: account2.
	self assert: (AccountTransferNet of: account1) equals: -20*peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:22:34'!
test03TransferNetOfAnAccountWithADepositAndWithdrawLegIsTheNetValue
	|account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Transfer amount: 20 from: account1 to: account2.
	Transfer amount: 50 from: account2 to: account1.
	self assert: (AccountTransferNet of: account1) equals: 30*peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:22:34'!
test04TransferNetOfAnAccountWithADepositLegIsTheDepositLegValue
	|account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Transfer amount: 20 from: account1 to: account2.
	self assert: (AccountTransferNet of: account2) equals: 20*peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:22:34'!
test05TranferNetOnlyTakesIntoAccountTransferLegs	
	|account1 account2 |
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	
	Deposit register: 15*peso on: account1.
	Withdraw register: 200*peso on: account1.
	Transfer amount: 20 from: account1 to: account2.
	Transfer amount: 50 from: account2 to: account1.
	self assert: (AccountTransferNet of: account1) equals: 30*peso.! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:35:07'!
test06TransferNetOfAnEmptyPortfolioIsZeroPesos
	|aPortfolioWithZeroAccounts|
	aPortfolioWithZeroAccounts _ Portfolio new.
	
	self assert: (AccountTransferNet of: aPortfolioWithZeroAccounts) equals: 0*peso.
	! !

!AccountTransferNetTest methodsFor: 'tests' stamp: 'valentina 6/14/2022 19:39:45'!
test07TransferNetOfAPortfolioWithAnAccountThatHasTransactionsIsTheExpectedBalance
	|aPortfolioWithAnAccount firstAccount secondAccount|
	firstAccount _ ReceptiveAccount new.
	secondAccount _ ReceptiveAccount new.
	Transfer amount: 18 from: firstAccount to: secondAccount.
	
	aPortfolioWithAnAccount _ Portfolio with: secondAccount.
	
	self assert: (AccountTransferNet of: aPortfolioWithAnAccount) equals: 18*peso.! !


!classDefinition: #PortfolioDetailedTreePrinterTest category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TestCase subclass: #PortfolioDetailedTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 09:50:50'!
test01PortfolioDetailedTreePrinterCanNotPrintAnUnnamedPortfolio
	| aPortfolio | aPortfolio _ Portfolio named: ''.
	self should: [ PortfolioDetailedTreePrinter of: aPortfolio]
	       raise: Error
	       withExceptionDo: [:anError| self assert: anError messageText equals: PortfolioDetailedTreePrinter canNotPrintATreeOfAnAnUnnamedAccountErrorDescription].
	       ! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 09:54:09'!
test02PortfolioDetailedTreePrinterCanPrintTheNameOfAPortfolioAndItsBalance
	| aPortfolioChiquito expectedDetailedTree| 
	aPortfolioChiquito _ Portfolio named: 'Portfolio chiquito'.
	expectedDetailedTree _ OrderedCollection newFrom: {'Portfolio chiquito'. String tab, String tab, 'Balance = 0 pesos'}.
	self assert: (PortfolioDetailedTreePrinter of: aPortfolioChiquito) equals: expectedDetailedTree.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 09:56:51'!
test03PortfolioDetailesTreePrinterCanPrintAPortfolioWithAnAccountWithNoTransactions
	| aPortfolioChiquito expectedDetailedTree anAccount | 
	aPortfolioChiquito _ Portfolio named: 'Portfolio chiquito'.
	anAccount  _ ReceptiveAccount named: 'Cuenta mía'.
	aPortfolioChiquito add: anAccount.
	expectedDetailedTree _ OrderedCollection newFrom: {'Portfolio chiquito'.String tab, String tab, 'Cuenta mía'.String tab, String tab,String tab, String tab, 'Balance = 0 pesos'. String tab, String tab, 'Balance = 0 pesos'}.

	self assert: (PortfolioDetailedTreePrinter of: aPortfolioChiquito ) equals: expectedDetailedTree.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 09:56:45'!
test04PortfolioDetailedPrinterCanPrintAPortfolioAndAnAccountWithItsSummary
	| aPortfolioChiquito expectedDetailedTree anAccount | 
	aPortfolioChiquito _ Portfolio named: 'Portfolio chiquito'.
	anAccount  _ ReceptiveAccount named: 'Cuenta mía'.
	Deposit register: 5000 * peso  on: anAccount. 
	aPortfolioChiquito add: anAccount.
	expectedDetailedTree _ OrderedCollection newFrom: {'Portfolio chiquito'.
						String tab, String tab, 'Cuenta mía'.
						String tab,String tab,String tab, String tab,'Depósito por 5000 pesos'. 
						String tab,String tab, String tab, String tab,'Balance = 5000 pesos'.
						 String tab, String tab, 'Balance = 5000 pesos'}.

	self assert: (PortfolioDetailedTreePrinter of: aPortfolioChiquito) equals: expectedDetailedTree.! !

!PortfolioDetailedTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 09:59:38'!
test05PortfolioDetailedTreePrinterCanPrintAComposedPortfolioWithManyAccountsAndTheirSummaries
	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount expectedTree |
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	
	Deposit register: 5*peso on: myAccount.
	Transfer amount: 5 from: angiesAccount to: johnsAccount.
	expectedTree _ OrderedCollection newFrom: {'Portfolio de la familia'.
   				   String tab, String tab,'Cuenta mia'.
				   String tab,String tab, String tab, String tab,'Depósito por 5 pesos'.
				   String tab,String tab, String tab, String tab,'Balance = 5 pesos'.
    				   String tab, String tab,'Portfolio de hijos'.
      			 	   String tab, String tab,String tab, String tab,'Cuenta de Juan'.
			           String tab,String tab, String tab, String tab,String tab,String tab,'Entrada por transferencia de 5 pesos'.
				   String tab,String tab, String tab, String tab,String tab,String tab,'Balance = 5 pesos'.
       			          String tab, String tab,String tab, String tab,'Cuenta de Angeles'.
				   String tab,String tab, String tab, String tab,String tab,String tab,'Salida por transferencia de 5 pesos'.
				   String tab,String tab, String tab, String tab,String tab,String tab,'Balance = -5 pesos'.
			          String tab, String tab,String tab, String tab,'Balance = 0 pesos'.
				  String tab, String tab,'Balance = 5 pesos'}.
		
	self assert: (PortfolioDetailedTreePrinter of: familyPortfolio) equals: expectedTree.
	
	
! !


!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #PortfolioTreePrinterTest category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TestCase subclass: #PortfolioTreePrinterTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 09:59:58'!
test01PortfolioTreePrinterCanNotPrintAnUnnamedPortfolio
	|portfolio|
	portfolio  _ Portfolio named: ''.
	
	self should:  [PortfolioTreePrinter of: portfolio]
	       raise: Error
	       withExceptionDo:[:anError| self assert: anError messageText equals: PortfolioTreePrinter canNotPrintATreeOfAnAnUnnamedAccountErrorDescription].! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 10:00:28'!
test02PortfolioTreePrinterCanPrintTheNameOfAPortfolio
	|portfolio|
	portfolio  _ Portfolio named: 'Portfolio chiquito'.
	
	self assert:  (PortfolioTreePrinter of: portfolio) equals: (OrderedCollection with:'Portfolio chiquito').! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 10:00:35'!
test03PortfolioTreePrinterCanPrintAPortfolioWithAnAccount
	|portfolio anAccount expectedTree|
	expectedTree _ OrderedCollection newFrom: {'Portfolio chiquito'. 
			          String tab,String tab,'Mi cuenta'}.
	portfolio  _ Portfolio named: 'Portfolio chiquito'.
	anAccount _ ReceptiveAccount named: 'Mi cuenta'.
	portfolio add: anAccount.
	self assert:  (PortfolioTreePrinter of: portfolio) equals: expectedTree.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 10:00:44'!
test04PortfolioTreePrinterCanPrintAComposedPortfolioWithAnAccount
	|portfolio portfolio2 anAccount expectedTree|
	expectedTree _ OrderedCollection newFrom: {'Portfolio chiquito'. 
				   String tab,String tab,'Portfolio porfiado'. 
				   String tab,String tab,'Mi cuenta'}.
	portfolio  _ Portfolio named: 'Portfolio chiquito'.
	portfolio2 _ Portfolio named: 'Portfolio porfiado'.
	anAccount _ ReceptiveAccount named: 'Mi cuenta'.
	portfolio add: portfolio2.
	portfolio add: anAccount.

	self assert:  (PortfolioTreePrinter of: portfolio) equals: expectedTree.! !

!PortfolioTreePrinterTest methodsFor: 'tests' stamp: 'valentina 6/16/2022 10:00:55'!
test05PortfolioTreePrinterCanPrintAComposedPortfolioWithManyAccounts
	| angiesAccount childrenPortfolio familyPortfolio johnsAccount myAccount expectedTree|
	johnsAccount := ReceptiveAccount named: 'Cuenta de Juan'. 
	angiesAccount := ReceptiveAccount named: 'Cuenta de Angeles'. 
	childrenPortfolio := Portfolio named: 'Portfolio de hijos' with: johnsAccount with: angiesAccount. 
	myAccount := ReceptiveAccount named: 'Cuenta mia'. 
	familyPortfolio := Portfolio named: 'Portfolio de la familia' with: myAccount with: childrenPortfolio.
	expectedTree _ OrderedCollection newFrom: {'Portfolio de la familia'.
   				   String tab, String tab,'Cuenta mia'.
    				   String tab, String tab,'Portfolio de hijos'.
      			 	   String tab, String tab,String tab, String tab,'Cuenta de Juan'.
       			           String tab, String tab,String tab, String tab,'Cuenta de Angeles'}.
	self assert: (PortfolioTreePrinter of: familyPortfolio) equals: expectedTree.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'tests' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'name accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !

!Portfolio methodsFor: 'initialization' stamp: 'algo3 6/14/2022 19:59:47'!
initializeWithName: aName
	name _ aName.! !


!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'reports' stamp: 'algo3 6/14/2022 22:50:00'!
accept: aReport
	aReport visitPortfolio: self.! !

!Portfolio methodsFor: 'reports' stamp: 'algo3 6/14/2022 22:55:54'!
name
	^name.! !


!Portfolio methodsFor: 'composition' stamp: 'algo3 6/14/2022 23:00:58'!
accounts
	^accounts.! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'algo3 6/14/2022 20:12:55'!
named: aName
	^self new initializeWithName: aName
	! !

!Portfolio class methodsFor: 'instance creation' stamp: 'algo3 6/15/2022 22:23:09'!
named: aName with: anAccount with: anotherAccount

	^self new 
		initializeWithName: aName;
		add: anAccount;
		add: anotherAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions name'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'algo3 6/14/2022 20:10:24'!
initializeWithName: aName
	name _ aName.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'algo3 6/12/2022 17:33:45'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'reports' stamp: 'algo3 6/14/2022 22:51:12'!
accept: aReport
	aReport visitAReceptiveAccount: self.! !

!ReceptiveAccount methodsFor: 'reports' stamp: 'algo3 6/14/2022 22:55:41'!
name
	^name.! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'name' stamp: 'algo3 6/14/2022 20:10:03'!
named: aName
	^self new initializeWithName: aName.! !


!classDefinition: #AccountReport category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Object subclass: #AccountReport
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!AccountReport methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:46:06'!
visitDeposit: aDeposit
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:47:00'!
visitDepositLeg: aDepositLeg
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:46:41'!
visitWithdraw: aWithdraw
	self subclassResponsibility ! !

!AccountReport methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:46:49'!
visitWithdrawLeg: aWithdrawLeg
	self subclassResponsibility ! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Ejercicio-Solucion'!
AccountReport subclass: #AccountSummary
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!AccountSummary methodsFor: 'addition' stamp: 'gaby 6/13/2022 14:14:57'!
add: aDescriptionOfATransaction
	summary add: aDescriptionOfATransaction.! !

!AccountSummary methodsFor: 'addition' stamp: 'gaby 6/13/2022 14:20:11'!
addBalanceDescriptionOf: anAccount
	summary add: ('Balance = ' , anAccount balance amount asString, ' pesos').! !

!AccountSummary methodsFor: 'addition' stamp: 'valentina 6/14/2022 19:06:03'!
addTransactionsDescriptionsOf: anAccount

	anAccount transactions do: [:transaction| transaction accept: self].
	self addBalanceDescriptionOf: anAccount.
	^summary.! !


!AccountSummary methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:12:49'!
visitDeposit: aDeposit
	self add: 'Depósito por ', aDeposit value amount asString, ' pesos'.
	! !

!AccountSummary methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:14:35'!
visitDepositLeg: aTransactionDeposit
	self add: 'Entrada por transferencia de ', aTransactionDeposit value amount asString , ' pesos'! !

!AccountSummary methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:13:18'!
visitWithdraw: aWithdraw
	self add: 'Extracción por ', aWithdraw value amount asString, ' pesos'.
	! !

!AccountSummary methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:13:46'!
visitWithdrawLeg: aTransferWithdraw
	self add: 'Salida por transferencia de ', aTransferWithdraw value amount asString , ' pesos'! !


!AccountSummary methodsFor: 'initialize' stamp: 'gaby 6/13/2022 14:09:52'!
initialize
	summary _ OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'main protocol' stamp: 'gaby 6/13/2022 14:21:08'!
of: anAccount

	^self new addTransactionsDescriptionsOf: anAccount.
	! !


!classDefinition: #AccountTransferNet category: 'ServiciosFinancieros-Ejercicio-Solucion'!
AccountReport subclass: #AccountTransferNet
	instanceVariableNames: 'netBalance'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!AccountTransferNet methodsFor: 'main protocol' stamp: 'valentina 6/14/2022 19:21:51'!
getTransferNetOf: anAccount
	anAccount transactions do: [:aTransaction| aTransaction accept: self].
	^netBalance * peso.! !


!AccountTransferNet methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:20:45'!
visitDeposit: aDeposit
	
	! !

!AccountTransferNet methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:19:31'!
visitDepositLeg: aDepositLeg
	netBalance _  aDepositLeg affectBalance: netBalance.
	! !

!AccountTransferNet methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:20:57'!
visitWithdraw: aWithdraw
	
	! !

!AccountTransferNet methodsFor: 'visit' stamp: 'valentina 6/14/2022 19:19:44'!
visitWithdrawLeg: aWithdrawLeg
	netBalance _  aWithdrawLeg affectBalance: netBalance.
	! !


!AccountTransferNet methodsFor: 'initialize' stamp: 'va 6/13/2022 17:20:52'!
initialize
	netBalance _ 0.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNet class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
AccountTransferNet class
	instanceVariableNames: ''!

!AccountTransferNet class methodsFor: 'main protocol' stamp: 'valentina 6/14/2022 19:22:34'!
of: anAccount
	
	^AccountTransferNet new getTransferNetOf: anAccount.! !


!classDefinition: #TreePrinter category: 'ServiciosFinancieros-Ejercicio-Solucion'!
AccountReport subclass: #TreePrinter
	instanceVariableNames: 'listOfNames depth account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!TreePrinter methodsFor: 'instance creation' stamp: 'valentina 6/16/2022 09:23:29'!
initializeWith: anAccount
	self initializeWith: anAccount andDepth: 0.! !

!TreePrinter methodsFor: 'instance creation' stamp: 'valentina 6/16/2022 09:23:47'!
initializeWith: anAccount andDepth: aDepth
	listOfNames _ OrderedCollection new.
	account _ anAccount.
	depth  _ aDepth.! !


!TreePrinter methodsFor: 'private' stamp: 'valentina 6/16/2022 09:25:49'!
addChildrenNamesOf: aPortfolio
	aPortfolio accounts do: [:anAccount | listOfNames addAll: (self class of: anAccount	 withDepth: (depth + 1))].! !

!TreePrinter methodsFor: 'private' stamp: 'valentina 6/16/2022 09:28:59'!
addListOfNamesIn: aPortfolio
	
	aPortfolio accept: self.
	^listOfNames.! !

!TreePrinter methodsFor: 'private' stamp: 'valentina 6/16/2022 09:29:28'!
addNameOf: anAccount
	self verifyIfAnAccountNameIsNotEmpty: anAccount.
	listOfNames add: (self addTabTo: anAccount name).! !

!TreePrinter methodsFor: 'private' stamp: 'valentina 6/16/2022 09:40:28'!
addNumberOfTabs: aNumberOfTabsToAdd to: aLine
	|aLineCopy|
	aLineCopy  _ aLine copy.
	aNumberOfTabsToAdd *2 timesRepeat:[aLineCopy _ String tab, aLineCopy]. 
	"aclaración: agregamos 2 tabs como si fuera uno para que se note más"
	^aLineCopy
	! !

!TreePrinter methodsFor: 'private' stamp: 'valentina 6/16/2022 09:39:52'!
addTabTo: aLine
	^self addNumberOfTabs: depth to: aLine ! !

!TreePrinter methodsFor: 'private' stamp: 'valentina 6/16/2022 09:27:49'!
visitAReceptiveAccount: anAccount
	self subclassResponsibility ! !


!TreePrinter methodsFor: 'verify' stamp: 'valentina 6/16/2022 09:26:40'!
verifyIfAnAccountNameIsNotEmpty: anAccount
	(anAccount name = '') ifTrue: [self error: self class canNotPrintATreeOfAnAnUnnamedAccountErrorDescription].! !


!TreePrinter methodsFor: 'visit' stamp: 'valentina 6/16/2022 09:28:17'!
visitPortfolio: aPortfolio
	self subclassResponsibility ! !


!TreePrinter methodsFor: 'main protocol' stamp: 'valentina 6/16/2022 09:24:55'!
getTreeOfNames
	self addListOfNamesIn: account.
	^listOfNames.
	
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreePrinter class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TreePrinter class
	instanceVariableNames: ''!

!TreePrinter class methodsFor: 'creation' stamp: 'valentina 6/16/2022 09:21:05'!
of: anAccount
	^(self new initializeWith: anAccount) getTreeOfNames.! !

!TreePrinter class methodsFor: 'creation' stamp: 'valentina 6/16/2022 09:21:16'!
of: aPortfolio withDepth: aDepth
	^(self new initializeWith: aPortfolio andDepth: aDepth) getTreeOfNames.! !


!TreePrinter class methodsFor: 'error' stamp: 'valentina 6/16/2022 09:20:47'!
canNotDetailedPrintATreeOfAnAnUnnamedAccountErrorDescription
	^'Name of account is empty'! !

!TreePrinter class methodsFor: 'error' stamp: 'valentina 6/16/2022 09:37:57'!
canNotPrintATreeOfAnAnUnnamedAccountErrorDescription
	^'Name of account is empty'! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TreePrinter subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'algo3 6/15/2022 23:27:20'!
addBalanceOfPortfolio: aPortfolio
	listOfNames add: (self addNumberOfTabs: depth + 1  to:('Balance = ', aPortfolio balance amount asString, ' pesos'))! !

!PortfolioDetailedTreePrinter methodsFor: 'private' stamp: 'algo3 6/15/2022 23:12:58'!
addSummaryOf: anAccount
	|summary| summary _ AccountSummary of: anAccount.
	summary do:[:summaryLine| listOfNames add: (self addNumberOfTabs: depth +1 to: summaryLine)].
	! !


!PortfolioDetailedTreePrinter methodsFor: 'visit' stamp: 'algo3 6/15/2022 23:08:51'!
visitAReceptiveAccount: anAccount
	self addNameOf: anAccount. 
	self addSummaryOf: anAccount.! !

!PortfolioDetailedTreePrinter methodsFor: 'visit' stamp: 'algo3 6/15/2022 23:05:01'!
visitPortfolio: aPortfolio
	self addNameOf: aPortfolio. 
	self addChildrenNamesOf: aPortfolio.
	self addBalanceOfPortfolio: aPortfolio
	! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TreePrinter subclass: #PortfolioTreePrinter
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!PortfolioTreePrinter methodsFor: 'visit' stamp: 'algo3 6/14/2022 22:58:38'!
visitAReceptiveAccount: anAccount
	self addNameOf: anAccount. ! !

!PortfolioTreePrinter methodsFor: 'visit' stamp: 'algo3 6/15/2022 22:59:06'!
visitPortfolio: aPortfolio
	self addNameOf: aPortfolio. 
	self addChildrenNamesOf: aPortfolio.
	! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'reports' stamp: 'valentina 6/14/2022 19:08:53'!
accept: anAccountReport
	self subclassResponsibility .! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'reports' stamp: 'valentina 6/14/2022 19:15:18'!
accept: anAccountReport
	anAccountReport visitDeposit: self. ! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !

!Deposit class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'reports' stamp: 'valentina 6/16/2022 09:38:41'!
accept: anAccountReport
	self subclassResponsibility ! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'reports' stamp: 'valentina 6/14/2022 19:15:33'!
accept: anAccountReport
	anAccountReport visitDepositLeg: self.! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Ejercicio-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'gaby 6/13/2022 14:38:35'!
affectBalance: aBalance

	^aBalance - self value.! !


!TransferWithdrawLeg methodsFor: 'reports' stamp: 'valentina 6/14/2022 19:15:44'!
accept: anAccountReport
	anAccountReport visitWithdrawLeg: self.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'reports' stamp: 'valentina 6/14/2022 19:15:50'!
accept: anAccountReport
	anAccountReport visitWithdraw: self.! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
