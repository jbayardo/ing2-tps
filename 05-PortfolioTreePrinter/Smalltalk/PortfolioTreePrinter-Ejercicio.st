!classDefinition: #PortfolioTest category: #'PortfolioTreePrinter-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	account := ReceptiveAccount new.

	self assert: 0 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:45'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 05:34'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 = account balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:48'!
test04PortfolioBalanceIsSumOfManagedAccountsBalance

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	 	
	Deposit register: 100 on: account1.
	Deposit register: 200 on: account2.
		
	self assert:300 = complexPortfolio balance .
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 18:53'!
test05PortfolioCanManagePortfolios

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	Deposit register: 100 on:account1.
	Deposit register: 200 on: account2.
	Deposit register: 300 on: account3.

	self assert: 600 = composedPortfolio balance .! !

!PortfolioTest methodsFor: 'tests' stamp: 'JB 9/25/2017 20:14:42'!
test06ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account registers: deposit).
	self assert: (account registers: withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'JB 9/25/2017 20:14:47'!
test07ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account registers: deposit).
	self deny: (account registers:withdraw).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:51'!
test08PortfolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:25'!
test08PortofolioKnowsTransactionsRegisteredByItsManagedAccounts 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
 	self assert: (composedPortfolio registers: deposit1).
	self assert: (composedPortfolio registers: deposit2).
	self assert: (composedPortfolio registers: deposit3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:00'!
test10ReceptiveAccountManageItSelf 

	| account1 |
	account1 := ReceptiveAccount new.
		
	self assert: (account1 manages:account1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:01'!
test11ReceptiveAccountDoNotManageOtherAccount

	| account1 account2 |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
		
	self deny: (account1 manages: account2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:02'!
test12PortfolioManagesComposedAccounts

	| account1 account2 account3 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self assert: (complexPortfolio manages: account1).
	self assert: (complexPortfolio manages: account2).
	self deny: (complexPortfolio manages: account3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:03'!
test13PortfolioManagesComposedAccountsAndPortfolios 

	| account1 account2 account3 complexPortfolio composedPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	self assert: (composedPortfolio manages: account1).
	self assert: (composedPortfolio manages: account2).
	self assert: (composedPortfolio manages: account3).
	self assert: (composedPortfolio manages: complexPortfolio).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:28'!
test14AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on:account1.
		
	self assert: 1=account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/18/2011 17:15'!
test15PortfolioTransactionsIsTheUnionOftsAccountsTransactions 

	| account1 account2 account3 complexPortfolio account composedPortfolio deposit1 deposit2 deposit3 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 200 on: account2.
	deposit3 := Deposit register: 300 on: account3.
		
	self assert: 3 = composedPortfolio transactions size .
	self assert: (composedPortfolio transactions includes: deposit1).
	self assert: (composedPortfolio transactions includes: deposit2).
	self assert: (composedPortfolio transactions includes: deposit3).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test16PortfolioKnowsItsAccountsTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1= (composedPortfolio transactionsOf:account1) size .
	self assert: ((composedPortfolio transactionsOf: account1) includes:deposit1).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:23'!
test17PortfolioKnowsItsPortfoliosTransactions 

	| account1 account2 account3 complexPortfolio composedPortfolio deposit1 deposit2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.
		
	deposit1 := Deposit register: 100 on: account1.
	deposit2 := Deposit register: 100 on: account2.
	Deposit register: 100 on: account3.
		
	self assert: 2 = (composedPortfolio transactionsOf:complexPortfolio) size .
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit1).
	self assert: ((composedPortfolio transactionsOf:complexPortfolio) includes:deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/12/2011 13:24'!
test18PortfolioCanNotAnswerTransactionsOfNotManagedAccounts 

	| account1 account2 account3 complexPortfolio |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	account3 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.
		
	self 
		should: [ complexPortfolio transactionsOf:account3 ] 
		raise: Error 
		withExceptionDo: [ :accountNotManaged |
			self assert: Portfolio accountNotManagedMessageDescription = accountNotManaged messageText ]
! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:28'!
test19CanNotCreatePortfoliosWithRepeatedAccount 

	| account1 |
	account1 := ReceptiveAccount new.
	self 
		should: [ Portfolio with: account1 with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage  = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/13/2011 19:15'!
test20CanNotCreatePortfoliosWithAccountsManagedByOtherManagedPortfolio 

	| account1 account2 complexPortfolio |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	complexPortfolio := Portfolio with: account1 with: account2.

	self 
		should: [ Portfolio with: complexPortfolio with: account1 ]
		raise: Error
		withExceptionDo: [ :invalidPortfolio |
			self assert: Portfolio accountAlreadyManagedErrorMessage = invalidPortfolio messageText ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'JB 9/27/2017 17:13:13'!
test21TransferShouldWithdrawFromFromAccountAndDepositIntoToAccount
	| fromAccount toAccount |
	fromAccount _ ReceptiveAccount new.
	toAccount _ ReceptiveAccount new.
	Transfer
		initializeFor: 100
		from: fromAccount
		to: toAccount.
	self assert: -100 = fromAccount balance.
	self assert: 100 = toAccount balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'JB 9/27/2017 17:13:13'!
test22AccountSummaryShouldProvideHumanReadableTransactionsDetail
	| fromAccount toAccount lines |
	fromAccount _ ReceptiveAccount new.
	toAccount _ ReceptiveAccount new.
	Deposit
		register: 100
		on: fromAccount.
	Withdraw
		register: 50
		on: fromAccount.
	Transfer
		initializeFor: 100
		from: fromAccount
		to: toAccount.
	lines _ self accountSummaryLinesOf: fromAccount.
	self assert: 3 = lines size.
	self assert: 'Deposito por 100' = (lines at: 1).
	self assert: 'Extraccion por 50' = (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JB 9/27/2017 17:13:13'!
test23ShouldBeAbleToBeQueryTransferNet
	| fromAccount toAccount |
	fromAccount _ ReceptiveAccount new.
	toAccount _ ReceptiveAccount new.
	Deposit
		register: 100
		on: fromAccount.
	Withdraw
		register: 50
		on: fromAccount.
	Transfer
		initializeFor: 100
		from: fromAccount
		to: toAccount.
	Transfer
		initializeFor: 250
		from: toAccount
		to: fromAccount.
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JB 9/27/2017 17:13:13'!
test24CertificateOfDepositShouldWithdrawInvestmentValue
	| account toAccount |
	account _ ReceptiveAccount new.
	toAccount _ ReceptiveAccount new.
	Deposit
		register: 1000
		on: account.
	Withdraw
		register: 50
		on: account.
	Transfer
		initializeFor: 100
		from: account
		to: toAccount.
	CertificateOfDeposit
		register: 100
		during: 30
		at: 1 / 10
		on: account.
	self assert: 100 = (self investmentNetOf: account).
	self assert: 750 = account balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 7/14/2011 06:58'!
test25ShouldBeAbleToQueryInvestmentEarnings

	| account investmentEarnings |
	account := ReceptiveAccount new. 
		
	CertificateOfDeposit register: 100 during: 30 at: 1/10 on: account.
	CertificateOfDeposit register: 100 during: 60 at: 15/100 on: account.

	investmentEarnings := 
		(100*((1/10)/360)*30) +
		(100*((15/100)/360)*60).
		
	self assert: investmentEarnings = (self investmentEarningsOf: account).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JB 9/27/2017 17:13:13'!
test26AccountSummaryShouldWorkWithCertificateOfDeposit
	| fromAccount toAccount lines |
	fromAccount _ ReceptiveAccount new.
	toAccount _ ReceptiveAccount new.
	Deposit
		register: 100
		on: fromAccount.
	Withdraw
		register: 50
		on: fromAccount.
	Transfer
		initializeFor: 100
		from: fromAccount
		to: toAccount.
	CertificateOfDeposit
		register: 1000
		during: 30
		at: 1 / 10
		on: fromAccount.
	lines _ self accountSummaryLinesOf: fromAccount.
	self assert: 4 = lines size.
	self assert: 'Deposito por 100' = (lines at: 1).
	self assert: 'Extraccion por 50' = (lines at: 2).
	self assert: 'Transferencia por -100' = (lines at: 3).
	self assert: 'Plazo fijo por 1000 durante 30 dias a una tna de 10%' = (lines at: 4).! !

!PortfolioTest methodsFor: 'tests' stamp: 'JB 9/27/2017 17:13:13'!
test27ShouldBeAbleToBeQueryTransferNetWithCertificateOfDeposit
	| fromAccount toAccount |
	fromAccount _ ReceptiveAccount new.
	toAccount _ ReceptiveAccount new.
	Deposit
		register: 100
		on: fromAccount.
	Withdraw
		register: 50
		on: fromAccount.
	Transfer
		initializeFor: 100
		from: fromAccount
		to: toAccount.
	Transfer
		initializeFor: 250
		from: toAccount
		to: fromAccount.
	CertificateOfDeposit
		register: 1000
		during: 30
		at: 1 / 10
		on: fromAccount.
	self assert: 150 = (self accountTransferNetOf: fromAccount).
	self assert: -150 = (self accountTransferNetOf: toAccount).! !

!PortfolioTest methodsFor: 'tests' stamp: 'Damian Fuman 9/27/2017 13:34:59'!
test28PortfolioTreePrinterPrintsTheCompositeInDepthFirstOrder

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self portofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: 'composedPortfolio' = (lines at: 1).
	self assert: ' complexPortfolio' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: '  account2' = (lines at: 4).
	self assert: ' account3' = (lines at: 5).! !

!PortfolioTest methodsFor: 'tests' stamp: 'HernanWilkinson 9/26/2011 16:30'!
test29ReversePortfolioTreePrinterPrintsTheCompositeStartingFromTheLeaves

	| account1 account2 account3 complexPortfolio composedPortfolio accountNames lines |
	account1 := ReceptiveAccount new. 
	account2 := ReceptiveAccount new. 
	account3 := ReceptiveAccount new. 
	complexPortfolio := Portfolio with: account1 with: account2.
	composedPortfolio := Portfolio with: complexPortfolio with: account3.

	accountNames := Dictionary new.
	accountNames at: composedPortfolio put: 'composedPortfolio'.
	accountNames at: complexPortfolio put: 'complexPortfolio'.
	accountNames at: account1 put: 'account1'.
	accountNames at: account2 put: 'account2'.
	accountNames at: account3 put: 'account3'.
		
	lines := self reversePortofolioTreeOf: composedPortfolio namingAccountWith: accountNames.
		
	self assert: 5 = lines size.
	self assert: ' account3' = (lines at: 1).
	self assert: '  account2' = (lines at: 2).
	self assert: '  account1' = (lines at: 3).
	self assert: ' complexPortfolio' = (lines at: 4).
	self assert: 'composedPortfolio' = (lines at: 5).
	! !


!PortfolioTest methodsFor: 'test support' stamp: 'JB 9/28/2017 10:31:32'!
accountSummaryLinesOf: aReceptiveAccount
	^ (AccountPrinter for: aReceptiveAccount) textSummary.! !

!PortfolioTest methodsFor: 'test support' stamp: 'Damian Fuman 9/28/2017 11:35:32'!
accountTransferNetOf: aReceptiveAccount

	^ (AccountTransferNetCalculator for: aReceptiveAccount) transferNet .! !

!PortfolioTest methodsFor: 'test support' stamp: 'Damian Fuman 9/28/2017 11:35:43'!
investmentEarningsOf: aReceptiveAccount

	^ (AccountInvestmentEarningsCalculator for: aReceptiveAccount) investmentEarnings .! !

!PortfolioTest methodsFor: 'test support' stamp: 'Damian Fuman 9/28/2017 11:35:57'!
investmentNetOf: aReceptiveAccount

	^ (AccountInvestmentNetCalculator for: aReceptiveAccount) investmentNet .! !

!PortfolioTest methodsFor: 'test support' stamp: 'JB 9/28/2017 10:08:31'!
portofolioTreeOf: aPortfolio namingAccountWith: aDictionaryOfNames
	^ (PortfolioPrinter
		for: aPortfolio
		withNames: aDictionaryOfNames) portfolioTree.! !

!PortfolioTest methodsFor: 'test support' stamp: 'JB 9/28/2017 10:08:31'!
reversePortofolioTreeOf: aPortfolio namingAccountWith: aDictionaryOfNames
	^ (PortfolioPrinter
		for: aPortfolio
		withNames: aDictionaryOfNames) reversePortfolioTree.! !


!classDefinition: #AccountInvestmentEarningsCalculator category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountInvestmentEarningsCalculator
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentEarningsCalculator methodsFor: 'initialization' stamp: 'Damian Fuman 9/28/2017 11:33:34'!
initializeFor: aReceptiveAccount

	account := aReceptiveAccount .! !


!AccountInvestmentEarningsCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:33:34'!
account

	^ account .! !

!AccountInvestmentEarningsCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:06:24'!
dispatcherCertificateOfDeposit: aCertificateOfDeposit
	^ aCertificateOfDeposit value * (aCertificateOfDeposit nominalAnnualRate / 360 * aCertificateOfDeposit numberOfDays) .! !

!AccountInvestmentEarningsCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:08:11'!
dispatcherDeposit: aDeposit
	^ 0 .! !

!AccountInvestmentEarningsCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:08:05'!
dispatcherTransferDeposit: aTransferDeposit
	^ 0 .! !

!AccountInvestmentEarningsCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:07:53'!
dispatcherTransferWithdraw: aTransferWithdraw
	^ 0 .! !

!AccountInvestmentEarningsCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:07:44'!
dispatcherWithdraw: aWithdraw
	^ 0 .! !

!AccountInvestmentEarningsCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:07:01'!
investmentEarnings

	^ self account transactions sum: [ :trans |
		trans dispatchByType: self ] .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountInvestmentEarningsCalculator class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestmentEarningsCalculator class
	instanceVariableNames: ''!

!AccountInvestmentEarningsCalculator class methodsFor: 'as yet unclassified' stamp: 'Damian Fuman 9/28/2017 11:33:34'!
for: aReceptiveAccount
	^ self new initializeFor: aReceptiveAccount .! !


!classDefinition: #AccountInvestmentNetCalculator category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountInvestmentNetCalculator
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountInvestmentNetCalculator methodsFor: 'initialization' stamp: 'Damian Fuman 9/28/2017 11:34:04'!
initializeFor: aReceptiveAccount

	account := aReceptiveAccount .! !


!AccountInvestmentNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:34:04'!
account

	^ account .! !

!AccountInvestmentNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:10:09'!
dispatcherCertificateOfDeposit: aCertificateOfDeposit
	^ aCertificateOfDeposit value .! !

!AccountInvestmentNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:10:34'!
dispatcherDeposit: aDeposit
	^ 0 .! !

!AccountInvestmentNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:11:04'!
dispatcherTransferDeposit: aTransferDeposit
	^ 0 .! !

!AccountInvestmentNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:10:52'!
dispatcherTransferWithdraw: aTransferWithdraw
	^ 0 .! !

!AccountInvestmentNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:10:44'!
dispatcherWithdraw: aWithdraw
	^ 0 .! !

!AccountInvestmentNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 12:11:11'!
investmentNet


	^ self account transactions sum: [ :trans |
		trans dispatchByType: self ] .
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountInvestmentNetCalculator class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountInvestmentNetCalculator class
	instanceVariableNames: ''!

!AccountInvestmentNetCalculator class methodsFor: 'as yet unclassified' stamp: 'Damian Fuman 9/28/2017 11:34:04'!
for: aReceptiveAccount
	^ self new initializeFor: aReceptiveAccount .! !


!classDefinition: #AccountPrinter category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountPrinter
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountPrinter methodsFor: 'initialization' stamp: 'JB 9/27/2017 17:45:32'!
initializeFor: anAccount

	account := anAccount .! !


!AccountPrinter methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:32:01'!
account

	^ account! !


!AccountPrinter methodsFor: 'printing' stamp: 'JB 9/28/2017 10:32:09'!
textSummary
	^ self account transactions
		inject: OrderedCollection new
		into: [ :aPartialAccountSummary :aTransaction |
			aPartialAccountSummary addLast: aTransaction textSummary.
			aPartialAccountSummary ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountPrinter class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountPrinter class
	instanceVariableNames: ''!

!AccountPrinter class methodsFor: 'as yet unclassified' stamp: 'JB 9/27/2017 17:34:28'!
for: anAccount

	^ self new initializeFor: anAccount .! !


!classDefinition: #AccountTransaction category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransaction methodsFor: 'evaluating' stamp: 'JB 9/27/2017 17:20:07'!
affectBalance: aBalance

	self subclassResponsibility .! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'Damian Fuman 9/28/2017 11:24:26'!
dispatchByType: anInstance

	self subclassResponsibility .! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'JB 9/28/2017 10:32:09'!
textSummary
	self subclassResponsibility.! !

!AccountTransaction methodsFor: 'evaluating' stamp: 'JB 9/28/2017 10:24:21'!
value
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'JB 9/27/2017 17:34:10'!
register: aValue on: account

	| withdraw |
	withdraw := self for: aValue .
	account register: withdraw .
	^ withdraw .! !


!classDefinition: #CertificateOfDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #CertificateOfDeposit
	instanceVariableNames: 'value numberOfDays nominalAnnualRate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:30:27'!
affectBalance: aBalance

	^ aBalance - self value .! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:58:50'!
dispatchByType: anInstance

	^anInstance dispatcherCertificateOfDeposit: self .! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:32:50'!
nominalAnnualRate

	^ nominalAnnualRate .! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:30:12'!
numberOfDays

	^ numberOfDays .! !

!CertificateOfDeposit methodsFor: 'accessing' stamp: 'JB 9/28/2017 10:24:21'!
value
	^ value.! !


!CertificateOfDeposit methodsFor: 'initialization' stamp: 'JB 9/27/2017 17:33:10'!
initializeFor: anAmount during: aNumberOfDays at: aRate

	value := anAmount .
	numberOfDays := aNumberOfDays .
	nominalAnnualRate := aRate .! !


!CertificateOfDeposit methodsFor: 'printing' stamp: 'JB 9/28/2017 10:32:09'!
textSummary
	^ 'Plazo fijo por ' , self value printString , ' durante ' , self numberOfDays printString , ' dias a una tna de ' , (self nominalAnnualRate * 100) printString , '%'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CertificateOfDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
CertificateOfDeposit class
	instanceVariableNames: ''!

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'JB 9/27/2017 17:33:41'!
for: anAmount during: aNumberOfDays at: aRate

	^ self new
		initializeFor: anAmount
		during: aNumberOfDays
		at: aRate .! !

!CertificateOfDeposit class methodsFor: 'as yet unclassified' stamp: 'JB 9/27/2017 17:34:19'!
register: anAmount during: aNumberOfDays at: aRate on: anAccount

	| transaction |
	transaction := self for: anAmount during: aNumberOfDays at: aRate .
	anAccount register: transaction .
	^ transaction .! !


!classDefinition: #Deposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'JB 9/27/2017 17:35:20'!
initializeFor: aValue

	value := aValue .! !


!Deposit methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:35:07'!
affectBalance: aBalance

	^ aBalance + self value .! !

!Deposit methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:59:40'!
dispatchByType: anInstance

	^anInstance dispatcherDeposit: self .! !

!Deposit methodsFor: 'accessing' stamp: 'JB 9/28/2017 10:24:21'!
value
	^ value.! !


!Deposit methodsFor: 'printing' stamp: 'JB 9/28/2017 10:32:09'!
textSummary
	^ 'Deposito por ' , self value printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'PortfolioTreePrinter-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'JB 9/27/2017 17:34:52'!
for: aValue

	^ self new initializeFor: aValue .! !

!Deposit class methodsFor: 'instance creation' stamp: 'JB 9/27/2017 17:34:47'!
register: aValue on: account

	| withdraw |
	withdraw := self for: aValue .
	account register: withdraw .
	^ withdraw .! !


!classDefinition: #TransferDeposit category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferDeposit methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:23:06'!
affectBalance: aBalance

	^ aBalance + self value .! !

!TransferDeposit methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:58:41'!
dispatchByType: anInstance

	^anInstance dispatcherTransferDeposit: self .! !

!TransferDeposit methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:23:33'!
transfer
	^ transfer.! !

!TransferDeposit methodsFor: 'accessing' stamp: 'JB 9/28/2017 10:24:21'!
value
	^ self transfer value.! !


!TransferDeposit methodsFor: 'initialization' stamp: 'JB 9/27/2017 17:22:42'!
initializeFor: aTransfer
	transfer := aTransfer.! !


!TransferDeposit methodsFor: 'printing' stamp: 'JB 9/28/2017 10:32:09'!
textSummary
	^ 'Transferencia por ' , self value printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'JB 9/27/2017 17:22:22'!
for: aTransfer

	^ self new initializeFor: aTransfer. ! !

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'JB 9/27/2017 17:09:30'!
register: aTransfer on: anAccount

	| transaction |	
	transaction := self for: aTransfer.
	anAccount register: transaction .
	^ transaction.
	! !


!classDefinition: #TransferWithdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!TransferWithdraw methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:24:41'!
affectBalance: aBalance

	^ aBalance - self value .! !

!TransferWithdraw methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:58:35'!
dispatchByType: anInstance

	^anInstance dispatcherTransferWithdraw: self .! !

!TransferWithdraw methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:24:49'!
transfer

	^ transfer .! !

!TransferWithdraw methodsFor: 'accessing' stamp: 'JB 9/28/2017 10:24:21'!
value
	^ self transfer value.! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'JB 9/27/2017 17:24:17'!
initializeFor: aTransfer

	transfer := aTransfer .! !


!TransferWithdraw methodsFor: 'printing' stamp: 'JB 9/28/2017 10:32:09'!
textSummary
	^ 'Transferencia por -' , self value printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'JB 9/27/2017 17:10:37'!
for: aTransfer

	^ self new initializeFor: aTransfer value . ! !

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'JB 9/27/2017 17:10:26'!
register: aTransfer on: anAccount

	| transaction |
	transaction := self for: aTransfer.
	anAccount register: transaction.
	^ transaction.! !


!classDefinition: #Withdraw category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'JB 9/27/2017 16:48:16'!
initializeFor: aValue

	value := aValue .! !


!Withdraw methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:25:35'!
affectBalance: aBalance

	^ aBalance - self value.! !

!Withdraw methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:59:59'!
dispatchByType: anInstance

	^anInstance dispatcherWithdraw: self .! !

!Withdraw methodsFor: 'accessing' stamp: 'JB 9/28/2017 10:24:21'!
value
	^ value.! !


!Withdraw methodsFor: 'printing' stamp: 'JB 9/28/2017 10:32:09'!
textSummary
	^ 'Extraccion por ' , self value printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'PortfolioTreePrinter-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/14/2011 05:32'!
register: aValue on: account

	| withdraw |
	
	withdraw := self for: aValue.
	account register: withdraw.
		
	^ withdraw! !


!classDefinition: #AccountTransferNetCalculator category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #AccountTransferNetCalculator
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!AccountTransferNetCalculator methodsFor: 'initialization' stamp: 'Damian Fuman 9/28/2017 11:34:34'!
initializeFor: aReceptiveAccount

	account := aReceptiveAccount .! !


!AccountTransferNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:34:34'!
account

	^ account .! !

!AccountTransferNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:56:41'!
dispatcherCertificateOfDeposit: aCertificateOfDeposit
	^ 0.! !

!AccountTransferNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:57:04'!
dispatcherDeposit: aDeposit
	^ 0.! !

!AccountTransferNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:55:22'!
dispatcherTransferDeposit: aTransferDeposit
	^aTransferDeposit value .! !

!AccountTransferNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:56:09'!
dispatcherTransferWithdraw: aTransferWithdraw
	^(aTransferWithdraw value) negated .! !

!AccountTransferNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:57:15'!
dispatcherWithdraw: aWithdraw
	^ 0.! !

!AccountTransferNetCalculator methodsFor: 'accessing' stamp: 'Damian Fuman 9/28/2017 11:58:09'!
transferNet
	
	^ self account transactions sum: [ :trans |
		trans dispatchByType: self ] .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransferNetCalculator class' category: #'PortfolioTreePrinter-Ejercicio'!
AccountTransferNetCalculator class
	instanceVariableNames: ''!

!AccountTransferNetCalculator class methodsFor: 'as yet unclassified' stamp: 'Damian Fuman 9/28/2017 11:34:34'!
for: aReceptiveAccount
	^ self new initializeFor: aReceptiveAccount .! !


!classDefinition: #PortfolioPrinter category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #PortfolioPrinter
	instanceVariableNames: 'portfolio names'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!PortfolioPrinter methodsFor: 'initialization' stamp: 'JB 9/28/2017 10:09:33'!
initializeFor: aPortfolio withNames: aNamesMap
	portfolio := aPortfolio.
	names := aNamesMap.! !


!PortfolioPrinter methodsFor: 'accessing' stamp: 'JB 9/28/2017 09:56:03'!
names

	^ names .! !

!PortfolioPrinter methodsFor: 'accessing' stamp: 'JB 9/28/2017 09:55:59'!
portfolio

	^ portfolio .! !


!PortfolioPrinter methodsFor: 'private' stamp: 'JB 9/28/2017 10:06:20'!
portfolioTreeOf: anAccount withOrder: anOrder
	| tree |
	tree := OrderedCollection new.
	tree add: anOrder , (self names at: anAccount).
	(anAccount accounts) do: [ :aManagedAccount |
		tree addAll:
			(self
				portfolioTreeOf: aManagedAccount
				withOrder: anOrder , ' ') ].
	^ tree.! !

!PortfolioPrinter methodsFor: 'private' stamp: 'JB 9/28/2017 10:06:25'!
reversePortfolioTreeOf: anAccount withOrder: anOrder
	| tree |
	tree := OrderedCollection new.
	(anAccount accounts) reverseDo: [ :aManagedAccount |
		tree addAll:
			(self
				reversePortfolioTreeOf: aManagedAccount
				withOrder: anOrder , ' ') ].
	tree add: anOrder , (self names at: anAccount).
	^ tree.! !


!PortfolioPrinter methodsFor: 'evaluating' stamp: 'JB 9/28/2017 09:58:52'!
portfolioTree
	^ self portfolioTreeOf: self portfolio withOrder: '' .! !

!PortfolioPrinter methodsFor: 'evaluating' stamp: 'JB 9/28/2017 10:01:14'!
reversePortfolioTree
	^ self reversePortfolioTreeOf: self portfolio withOrder: '' .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PortfolioPrinter class' category: #'PortfolioTreePrinter-Ejercicio'!
PortfolioPrinter class
	instanceVariableNames: ''!

!PortfolioPrinter class methodsFor: 'as yet unclassified' stamp: 'JB 9/28/2017 10:09:16'!
for: aPortfolio withNames: aNamesMap
	^ self new
		initializeFor: aPortfolio
		withNames: aNamesMap.! !


!classDefinition: #SummarizingAccount category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #SummarizingAccount
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!SummarizingAccount methodsFor: 'testing' stamp: 'JB 9/27/2017 17:27:14'!
manages: anAccount

	self subclassResponsibility .! !

!SummarizingAccount methodsFor: 'testing' stamp: 'JB 9/27/2017 17:27:09'!
registers: aTransaction

	self subclassResponsibility .! !


!SummarizingAccount methodsFor: 'transactions' stamp: 'JB 9/27/2017 17:26:55'!
balance

	self subclassResponsibility .! !

!SummarizingAccount methodsFor: 'transactions' stamp: 'JB 9/27/2017 17:26:50'!
transactions

	self subclassResponsibility .! !


!SummarizingAccount methodsFor: 'accounts' stamp: 'JB 9/27/2017 17:27:01'!
accounts

	self subclassResponsibility .! !


!classDefinition: #Portfolio category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Portfolio methodsFor: 'testing' stamp: 'JB 9/27/2017 17:29:19'!
manages: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :managedAccount | managedAccount manages: anAccount ] ] .! !

!Portfolio methodsFor: 'testing' stamp: 'JB 9/27/2017 17:29:09'!
registers: aTransaction

	^ accounts anySatisfy: [ :anAccount | anAccount registers: aTransaction ] .! !


!Portfolio methodsFor: 'transactions' stamp: 'JB 9/27/2017 17:29:00'!
balance

	^ accounts sum: [ :account | account balance ] .! !

!Portfolio methodsFor: 'transactions' stamp: 'JB 9/27/2017 17:28:52'!
transactions

	^ accounts
		inject: OrderedCollection new
		into: [ :transactions :account |
			transactions addAll: account transactions. transactions ] .
	! !


!Portfolio methodsFor: 'initialization' stamp: 'JB 9/27/2017 17:28:32'!
initializeWithAll: aCollectionOfAccounts

	accounts := aCollectionOfAccounts .! !


!Portfolio methodsFor: 'accounts' stamp: 'JB 9/27/2017 17:35:48'!
accounts

	^ accounts .! !

!Portfolio methodsFor: 'accounts' stamp: 'JB 9/27/2017 17:28:20'!
transactionsOf: anAccount 

	^ (self manages: anAccount)
		ifTrue: [ anAccount transactions ]
		ifFalse: [ self error: self class accountNotManagedMessageDescription] .
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'PortfolioTreePrinter-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:48'!
with: anAccount1 with: anAccount2

	^ self withAll: (Array with: anAccount1 with: anAccount2 )! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 19:40'!
withAll: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size ifFalse: [ self error: self accountAlreadyManagedErrorMessage  ].
	
	aCollectionOfAccounts do: [ :sourceAccount | 
		aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ]]]].
	
	^self new initializeWithAll: aCollectionOfAccounts ! !


!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts

	^ aCollectionOfAccounts do: [ :targetAccount | 
			(sourceAccount = targetAccount) not ifTrue: [ 
				(sourceAccount manages: targetAccount) ifTrue: [ self error: self accountAlreadyManagedErrorMessage ] ] ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkAccountsAreUnique: aCollectionOfAccounts

	aCollectionOfAccounts asSet size = aCollectionOfAccounts size
		ifFalse: [ self error: self accountAlreadyManagedErrorMessage ]! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:21'!
checkCreationPreconditions: aCollectionOfAccounts

	self checkAccountsAreUnique: aCollectionOfAccounts.
	self checkNoCircularReferencesIn: aCollectionOfAccounts! !

!Portfolio class methodsFor: 'assertions' stamp: 'HernanWilkinson 9/18/2011 17:22'!
checkNoCircularReferencesIn: aCollectionOfAccounts

	aCollectionOfAccounts do: [ :sourceAccount | self check: sourceAccount doesNotManagaAnyOf: aCollectionOfAccounts ]! !


!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:28'!
accountAlreadyManagedErrorMessage

	^ 'Account already managed'! !

!Portfolio class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/13/2011 19:27'!
accountNotManagedMessageDescription
	
	^ 'Account not managed'! !


!classDefinition: #ReceptiveAccount category: #'PortfolioTreePrinter-Ejercicio'!
SummarizingAccount subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'JB 9/27/2017 17:36:27'!
balance

	^ transactions inject: 0 into: [ :balance :transaction | transaction affectBalance: balance ] .! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'JB 9/27/2017 17:36:31'!
register: aTransaction

	transactions add: aTransaction .! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'JB 9/27/2017 17:36:38'!
transactions

	^ transactions copy .! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'JB 9/27/2017 17:36:51'!
manages: anAccount

	^ self = anAccount .! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'JB 9/27/2017 17:36:59'!
registers: aTransaction

	^ transactions includes: aTransaction .
! !


!ReceptiveAccount methodsFor: 'accounts' stamp: 'JB 9/27/2017 17:37:04'!
accounts

	^#() .! !


!classDefinition: #Transfer category: #'PortfolioTreePrinter-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value from to withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'PortfolioTreePrinter-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'JB 9/27/2017 17:37:36'!
initializeFor: anAmountOfMoney from: aSourceAccount to: aTargetAccount

	value _ anAmountOfMoney .
	from _ aSourceAccount .
	to _ aTargetAccount .
	withdrawLeg _ TransferWithdraw
		register: self
		on: aSourceAccount .
	depositLeg _ TransferDeposit
		register: self
		on: aTargetAccount .! !


!Transfer methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:38:00'!
source

	^ from .! !

!Transfer methodsFor: 'accessing' stamp: 'JB 9/27/2017 17:38:03'!
target

	^ to .! !

!Transfer methodsFor: 'accessing' stamp: 'JB 9/28/2017 10:24:21'!
value
	^ value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: #'PortfolioTreePrinter-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'creating' stamp: 'JB 9/27/2017 17:13:13'!
initializeFor: anAmountOfMoney from: aSourceAccount to: aTargetAccount
	^ self new
		initializeFor: anAmountOfMoney
		from: aSourceAccount
		to: aTargetAccount.! !
