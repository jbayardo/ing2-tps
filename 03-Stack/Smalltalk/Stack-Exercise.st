!classDefinition: #OOStackTest category: #'Stack-Exercise'!
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

!OOStackTest methodsFor: 'test' stamp: 'JB 9/12/2017 18:30:50'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
 	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
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

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
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


!classDefinition: #Node category: #'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'accessing' stamp: 'JB 9/14/2017 20:15:12'!
next
	^ self subclassResponsibility.! !

!Node methodsFor: 'accessing' stamp: 'JB 9/14/2017 20:15:22'!
size
	^ self subclassResponsibility.! !

!Node methodsFor: 'accessing' stamp: 'JB 9/14/2017 20:17:06'!
value
	^ self subclassResponsibility.! !



!classDefinition: #EmptyNode category: #'Stack-Exercise'!
Node subclass: #EmptyNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!EmptyNode methodsFor: 'accessing' stamp: 'JB 9/14/2017 20:24:12'!
next
	self error: OOStack stackEmptyErrorDescription.! !

!EmptyNode methodsFor: 'accessing' stamp: 'JB 9/14/2017 20:24:24'!
size
	^ 0.! !

!EmptyNode methodsFor: 'accessing' stamp: 'JB 9/14/2017 20:24:20'!
value
	self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #NonEmptyNode category: #'Stack-Exercise'!
Node subclass: #NonEmptyNode
	instanceVariableNames: 'next element'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NonEmptyNode methodsFor: 'initialization' stamp: 'JB 9/15/2017 20:10:41'!
initializeFor: anElement withNext: aNode
	element := anElement.
	next := aNode.
	^ self.! !


!NonEmptyNode methodsFor: 'accessing' stamp: 'JB 9/14/2017 20:20:57'!
next
	^ next.! !

!NonEmptyNode methodsFor: 'accessing' stamp: 'JB 9/15/2017 20:10:17'!
size
	" Este cómputo es recursivo porque nos gusta la recursión. Podría también guardarse un colaborador interno con el tamaño sin demasiado trabajo. "
	^ self next size + 1.! !

!NonEmptyNode methodsFor: 'accessing' stamp: 'JB 9/14/2017 20:23:22'!
value
	^ element.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'NonEmptyNode class' category: #'Stack-Exercise'!
NonEmptyNode class
	instanceVariableNames: ''!

!NonEmptyNode class methodsFor: 'as yet unclassified' stamp: 'JB 9/15/2017 16:32:33'!
for: anElement withNext: aNextNode
	^ self new initializeFor: anElement withNext: aNextNode.! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'headNode'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'JB 9/15/2017 20:08:46'!
isEmpty
	" Esto podría hacerse agregando el método isEmpty a Node, pero preferimos utilizar esto porque nos parece más declarativo: es el stack el que está vacio, no el nodo en sí. Observemos que no comparamos contra class directo, si no que preguntamos si isKindOf. Esto nos permite extender el comportamiento de EmptyNode si fuese necesario, pero sin perder la noción de que no debería haber otro null object dentro de Node. "
	^ self first isKindOf: EmptyNode.! !

!OOStack methodsFor: 'accessing' stamp: 'JB 9/15/2017 19:58:25'!
size
	^ self first size.! !

!OOStack methodsFor: 'accessing' stamp: 'JB 9/15/2017 19:58:25'!
top
	^ self first value.! !


!OOStack methodsFor: 'private' stamp: 'JB 9/15/2017 19:58:25'!
first
	^ headNode.! !

!OOStack methodsFor: 'private' stamp: 'JB 9/15/2017 19:58:52'!
setFirst: aNode
	headNode _ aNode.! !


!OOStack methodsFor: 'adding' stamp: 'JB 9/15/2017 19:58:52'!
push: anElement
	| node |
	node _ NonEmptyNode
		for: anElement
		withNext: self first.
	self setFirst: node.! !


!OOStack methodsFor: 'removing' stamp: 'JB 9/15/2017 19:58:52'!
pop
	| top |
	top _ self top.
	self setFirst: self first next.
	^ top.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'JB 9/15/2017 19:58:52'!
new
	^ super new setFirst: EmptyNode new.! !

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !
