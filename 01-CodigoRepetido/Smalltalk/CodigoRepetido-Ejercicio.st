!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #Stopwatch category: #'CodigoRepetido-Ejercicio'!
Error subclass: #Stopwatch
	instanceVariableNames: 'measurementStartTime'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!Stopwatch methodsFor: 'as yet unclassified' stamp: 'JB 9/4/2017 19:36:22'!
elapsedTime

	| currentTime |

	currentTime := Time millisecondClockValue.
	^ measurementStartTime - currentTime! !

!Stopwatch methodsFor: 'as yet unclassified' stamp: 'JB 9/4/2017 19:36:28'!
start

	measurementStartTime := Time millisecondClockValue.! !


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'testing' stamp: 'JB 9/5/2017 19:52:12'!
closure: aClosure runsInUpToMillis: aNumberOfMilliseconds
	| stopwatch |
	stopwatch _ Stopwatch new.
	stopwatch start.
	aClosure value.
	^ stopwatch elapsedTime < aNumberOfMilliseconds.! !

!IdiomTest methodsFor: 'testing' stamp: 'JB 9/5/2017 19:49:40'!
closure: aClosure throws: anError andAfterwards: aValidatingClosure
	[aClosure value.
	self fail ]
		on: anError
		do: aValidatingClosure.! !

!IdiomTest methodsFor: 'testing' stamp: 'JB 9/5/2017 19:52:13'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	customerBook _ CustomerBook new.
	self assert:
		(self
			closure: [ customerBook addCustomerNamed: 'John Lennon' ]
			runsInUpToMillis: 50).! !

!IdiomTest methodsFor: 'testing' stamp: 'JB 9/5/2017 19:52:12'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook paulMcCartney |
	customerBook _ CustomerBook new.
	paulMcCartney _ 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	self assert:
		(self
			closure: [ customerBook removeCustomerNamed: paulMcCartney ]
			runsInUpToMillis: 100).! !

!IdiomTest methodsFor: 'testing' stamp: 'JB 9/5/2017 19:47:20'!
test03CanNotAddACustomerWithEmptyName
	| customerBook |
	customerBook _ CustomerBook new.
	self
		closure: [ customerBook addCustomerNamed: '' ]
		throws: Error
		andAfterwards: [ :anError |
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!IdiomTest methodsFor: 'testing' stamp: 'JB 9/5/2017 19:47:20'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |
	customerBook _ CustomerBook new.
	johnLennon _ 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	self
		closure: [ customerBook removeCustomerNamed: 'Paul McCartney' ]
		throws: NotFound
		andAfterwards: [ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
