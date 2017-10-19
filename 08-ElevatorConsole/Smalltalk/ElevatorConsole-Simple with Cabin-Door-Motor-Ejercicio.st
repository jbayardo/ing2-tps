Object subclass: #Cabin
	
	elevator reachedFloorToStop.
	self stop.
	door startOpening! !

	^currentFloorNumber! !

	^state isStopped! !
	
	^elevator hasFloorsToGo ! !
	
	^state isWaitingForPeople ! !
	
	^state isMoving! !

	elevator := anElevator.
	door := CabinDoor of: self.
	motor := Motor new.
	currentFloorNumber := 0.
	state := CabinStoppedState for: self .
	! !
	
	^motor isMovingClockwise ! !
	
	^motor isStopped! !

	"Esta implementacion es muy sencilla y asume que se esta yendo para arriba siempre"
	currentFloorNumber+1 ~=aFloorNumber ifTrue: [ self signalSensorDesincronized ]! !
	
	self error: self sensorDesincronizedErrorMessage! !
	
	^self class sensorDesincronizedErrorMessage! !
	
	"Si estoy parado no me pueden cerrar la puerta - Hernan"! !
	
	door startClosing .! !
	
	^state closeDoor! !
	
	door startClosing.
	self makeStopped! !
	
	"La puerta ya esta cerrada, no hay que hacer nada con este pedido - Hernan"! !
	
	self hasToWaitForPeople ifTrue: [ self waitForPeople ] ifFalse: [ elevator jobDone]! !
	
	"Esto sirve solo porque siempre se esta yendo para arriba :-)"
	motor moveClockwise.
	self makeMoving.
	
	state := CabinWaitingForPeopleState for: self! !
	
	state := CabinMovingState for: self! !
	
	state := CabinStoppedState for: self! !
	
	self startClosingDoor.
	self makeStopped.! !

	self assertIsMovingCorrectly: aFloorNumber.
		
	currentFloorNumber := aFloorNumber.
	elevator hasToStopOnCurrentFloor ifTrue: [self reachedFloorToStop ]
! !
	
	motor stop.
	self makeStopped! !
	
	"TODO: Faltan tests, por ejemplo para asertar que solo lo puede hacer si esta parada - Hernan"
	self makeWaitingForPeople
! !

	^door! !
	
	^'Sensor de cabina desincronizado'! !

	^self new initializeOf: anElevator! !
	! !

	cabin closeDoor.
	
	! !
	
	motor moveClockwise.
	self makeClosing	! !
	
	motor moveCounterClockwise.
	self makeOpening	! !
	
	state open! !

	^state isOpened ! !
	
	^state isOpening ! !
	
	^state isClosing! !
	
	^state isClosed! !
	
	self signalSensorDesincronized ! !
	
	self signalSensorDesincronized! !
	
	motor stop.
	self makeClosed.
	
	cabin doorClosed.! !
	
	self signalSensorDesincronized ! !

	cabin := aCabin.
	motor := Motor new.
	state :=CabinDoorOpenedState for: self .
	
	"TODO: Faltan tests para reaccionar distinto dependiendo del estado - Hernan"
	
	motor stop.
	self makeOpened.
	
	cabin doorOpened ! !
	
	state closed! !
	
	^motor isMovingCounterClockwise! !
	
	^motor isMovingClockwise! !
	
	^motor isStopped! !
	
	"No hago nada porque ya me estoy abriendo - Hernan"! !
	
	"Ya estoy abierta, no hago nada - Hernan"! !
	
	"Cuando la puerta esta cerrada no se puede abrir - Hernan"! !
	
	motor stop.
	self startOpening
	! !
	
	self error: self sensorDesincronizedErrorMessage! !
	
	^self class sensorDesincronizedErrorMessage ! !
	
	state := CabinDoorClosedState for: self! !
	
	state := CabinDoorOpenedState for: self! !
	
	state := CabinDoorOpeningState for: self .
	
	state := CabinDoorClosingState for: self .
	
	^'Sensor de puerta desincronizado'! !

	^self new initializeOf: aCabin ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !
	
	elevatorController := anElevatorController ! !

	door := aCabinDoor ! !
	
	^ self new initializeOf: anElevatorController   ! !

	^self new initializeFor: aCabinDoor ! !
	
	^door closedWhenClosed! !
	
	^door openWhenClosed! !
	
	^false! !
	
	^false! !
	
	^false! !
	
	^true! !

	aVisitor visitCabinDoorClosed: self! !
	
	^false! !
	
	^false! !
	
	^true! !
	
	^false! !
	
	^door closedWhenClosing! !

	aVisitor visitCabinDoorClosing: self! !
	
	^ elevatorController cabinDoorClosedWhenWorkingAndCabinStoppedAndCabinDoorStopped ! !
	
	^door openWhenClosing! !

	aVisitor visitCabinDoorOpened: self! !
	
	^door closedWhenOpened! !
	
	^door openWhenOpened! !

	^true! !
	
	^false! !
	
	^false! !
	
	^false! !
	
	^elevatorController cabinDoorClosedWhenWorkingAndCabinStoppedAndCabinDoorOpening! !
	
	^door closedWhenOpening! !
	
	^false! !
	
	^true! !
	
	^false! !
	
	^false! !
	
	^elevatorController closeCabinDoorWhenWorkingAndCabinStoppedAndCabinDoorOpening! !
	
	^door openWhenOpening! !

	aVisitor visitCabinDoorOpening: self! !
	
	elevatorController := anElevatorController ! !

	cabin := aCabin ! !

	self subclassResponsibility 
	! !

	self subclassResponsibility 
	! !

	self subclassResponsibility 
	! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !
	
	^self new initializeOf: anElevatorController   ! !

	^self new initializeFor: aCabin! !
	
	^false! !

	^false! !
	
	^true! !

	aVisitor visitCabinMoving: self! !
	
	cabin closeDoorWhenMoving! !

	aVisitor visitCabinStopped: self! !
	
	cabin closeDoorWhenStopped! !

	^true! !

	^false! !
	
	^false! !

	^false! !
	
	^true! !

	^false! !
	
	cabin closeDoorWhenWaitingForPeople! !

	aVisitor visitCabinWaitingForPeople: self! !
	
	floorsToGo removeFirst .! !

	floorsToGo add: aFloorNumber ! !

	self startWorkingGoingTo: aFloorNumber ! !
	
	self makeIdle ! !

	self queFloorToGo: aFloorNumber ! !

	self queFloorToGo: aFloorNumber.
	self makeWorking.
	cabin startClosingDoor.! !

	cabin := Cabin of: self.
	floorsToGo := SortedCollection new.
	state := ElevatorIdleState for: self.
	! !
	
	^floorsToGo notEmpty! !
	
	^state isWorking! !
	
	^floorsToGo first = cabin currentFloorNumber ! !

	^state isIdle! !

	^state goUpPushedFromFloor: aFloorNumber! !
	
	^cabin! !
	
	state := ElevatorIdleState for: self! !
	
	state := ElevatorWorkingState for: self! !

	self subclassResponsibility .! !
	
		self subclassResponsibility .! !
	
	self subclassResponsibility .! !

	self subclassResponsibility .! !
	
	self subclassResponsibility .! !
	
	self subclassResponsibility .! !

	
! !
	
	self subclassResponsibility .! !

	^ ElevatorConsoleRecorder new initializeOf: anElevator  ! !
	
	^ ReadStream on: stream contents ! !
	
	stream := WriteStream on: String new! !

	stream 
		nextPutAll: 'Puerta Abriendose'  ;
		nextPut: Character cr .! !
	! !
	
	stream 
		nextPutAll: 'Puerta Cerrandose';
		nextPut: Character cr .! !

	stream 
		nextPutAll: 'Puerta Cerrada';
		nextPut: Character cr .! !
	
	stream 
		nextPutAll: 'Cabina Detenida' ;
		nextPut: Character cr .! !
	
	stream 
		nextPutAll: 'Cabina Moviendose'  ;
		nextPut: Character cr .! !

	elevator := anElevator ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	self subclassResponsibility ! !

	^self new initializeFor: anElevator ! !

	^elevator goUpPushedFromFloorWhenIdle: aFloorNumber! !
	
	^false! !

	^true! !
		self subclassResponsibility .

		self subclassResponsibility .! !
	
		self subclassResponsibility .! !
	
		self subclassResponsibility .! !

		self subclassResponsibility .! !
	
		self subclassResponsibility .! !
	
		self subclassResponsibility .! !

		self subclassResponsibility .! !
	
	self subclassResponsibility .! !
	
	self subclassResponsibility .! !

	^ ElevatorStatusViewRecorder new initializeOf: anElevator! !
	
	^ cabinDoorFieldModel! !
	
	^ cabinFieldModel! !
	
	cabinDoorFieldModel := 'Closing'! !
	
	cabinFieldModel := 'Stopped'! !

	cabinDoorFieldModel := 'Opened'! !
	
	cabinFieldModel := 'Waiting for People'! !
	anElevator cabin subscribeToSV: self .
	
	cabinFieldModel := 'Moving'! !

	cabinDoorFieldModel := 'Closed'! !

	cabinDoorFieldModel := 'Opening'! !

	elevator goUpPushedFromFloor:2.
	door closed.
	cabin onFloor: 1.

	self
		should: [ cabin onFloor: 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = Cabin sensorDesincronizedErrorMessage ]! !

	self
		should: [ door closed ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = CabinDoor sensorDesincronizedErrorMessage ]! !

	elevator goUpPushedFromFloor:1.
	door closed.

	self
		should: [ door closed ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = CabinDoor sensorDesincronizedErrorMessage ]! !

	elevator goUpPushedFromFloor:3.
	door closed.

	self
		should: [ cabin onFloor:  3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = Cabin sensorDesincronizedErrorMessage ]! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.

	self
		should: [ door closed ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = CabinDoor sensorDesincronizedErrorMessage ]! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.

	self
		should: [ cabin onFloor: 0 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = Cabin sensorDesincronizedErrorMessage ]! !

	self assert: door isOpened.

	door open.

	self assert: door isOpened.! !

	elevator goUpPushedFromFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isClosing.

	door open.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped

! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	door open.
	
	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.

	self assert: elevator isWorking.
	self assert: cabin isMoving.
	self assert: door isClosed.

	door open.

	self assert: elevator isWorking.
	self assert: cabin isMoving.
	self assert: door isClosed.

	self assert: door isMotorStopped.
	self assert: cabin isMotorMovingClockwise
	! !

	self assert: elevator isIdle.
	self assert: cabin isStopped.
	self assert: door isOpened.
	self assert: cabin currentFloorNumber = 0
! !

	elevator goUpPushedFromFloor:1.
	door closed.

	self deny: elevator isIdle.
	self assert: elevator isWorking.

	self deny: cabin isStopped.
	self assert: cabin isMoving.

	self deny: door isOpened.
	self deny: door isOpening.
	self deny: door isClosing.
	self assert: door isClosed.

	self assert: door isMotorStopped.
	self assert: cabin isMotorMovingClockwise.! !

	elevator goUpPushedFromFloor: 1.

	self deny: elevator isIdle.
	self assert: elevator isWorking.

	self assert: cabin isStopped.
	self deny: cabin isMoving.

	self deny: door isOpened.
	self deny: door isOpening.
	self assert: door isClosing.
	self deny: door isClosed.

	self assert: door isMotorMovingClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor: 1.
	door closed.
	cabin onFloor:  1.

	self deny: elevator isIdle.
	self assert: elevator isWorking.

	self assert: cabin isStopped.
	self deny: cabin isMoving.

	self deny: door isOpened.
	self assert: door isOpening.
	self deny: door isClosing.
	self deny: door isClosed.

	self assert: cabin currentFloorNumber = 1.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped.

! !

	elevator goUpPushedFromFloor: 1.
	door closed.
	cabin onFloor:  1.
	door opened.

	self assert: elevator isIdle.
	self deny: elevator isWorking.

	self assert: cabin isStopped.
	self deny: cabin isMoving.

	self assert: door isOpened.
	self deny: door isOpening.
	self deny: door isClosing.
	self deny: door isClosed.

	self assert: cabin currentFloorNumber = 1.

	self assert: door isMotorStopped.
	self assert: cabin isMotorStopped.
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	elevator goUpPushedFromFloor:2.
	cabin onFloor: 1.
	door opened.
	cabin waitForPeopleTimedOut.
	door closed.
	cabin onFloor: 2.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: cabin currentFloorNumber equals: 2.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:2.
	door closed.
	elevator goUpPushedFromFloor:1.
	cabin onFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: cabin currentFloorNumber equals: 1.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	elevator goUpPushedFromFloor:2.
	cabin onFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: cabin currentFloorNumber equals: 1.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:2.
	door closed.
	elevator goUpPushedFromFloor:1.
	cabin onFloor: 1.
	door opened.
	cabin waitForPeopleTimedOut.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isClosing.

	self assert: cabin currentFloorNumber equals: 1.

	self assert: door isMotorMovingClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.
	elevator goUpPushedFromFloor:2.
	door opened.
	cabin waitForPeopleTimedOut.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isClosing.

	self assert: door isMotorMovingClockwise.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	door close.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isOpening.

	self assert: door isMotorMovingCounterClockwise.
	self assert: cabin isMotorStopped
	! !

	door close.

	self assert: elevator isIdle.
	self assert: cabin isStopped.
	self assert: door isOpened.

	self assert: door isMotorStopped.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.
	elevator goUpPushedFromFloor:2.
	door opened.

	self assert: elevator isWorking.
	self assert: cabin isWaitingForPeople.
	self assert: door isOpened.

	self assert: door isMotorStopped.
	self assert: cabin isMotorStopped
! !

	elevator goUpPushedFromFloor:1.
	door closed.
	cabin onFloor: 1.
	elevator goUpPushedFromFloor:2.
	door opened.

	self assert: elevator isWorking.
	self assert: cabin isWaitingForPeople.
	self assert: door isOpened.

	door close.

	self assert: elevator isWorking.
	self assert: cabin isStopped.
	self assert: door isClosing.

	self assert: door isMotorMovingClockwise.
	self assert: cabin isMotorStopped

! !

	elevator goUpPushedFromFloor:1.
	door closed.

	self assert: elevator isWorking.
	self assert: cabin isMoving.
	self assert: door isClosed.

	door close.

	self assert: elevator isWorking.
	self assert: cabin isMoving.
	self assert: door isClosed.

	self assert: door isMotorStopped.
	self assert: cabin isMotorMovingClockwise! !

	elevator := Elevator new.
	cabin := elevator cabin.
	door := cabin door.! !

	elevator := Elevator new.
	cabin := elevator cabin.
	door := cabin door.! !

	| elevatorConsole readStream |
	
	elevatorConsole := ElevatorConsole of: elevator.
		
	elevator goUpPushedFromFloor: 1.
	door closed.
	cabin onFloor: 1.  
					
	readStream := elevatorConsole consoleReadStream.

	self assert: 'Puerta Cerrandose' = readStream nextLine.
	self assert: 'Puerta Cerrada' = readStream nextLine.
	self assert: 'Cabina Moviendose' = readStream nextLine.
	self assert: 'Cabina Detenida' = readStream nextLine.
	self assert: 'Puerta Abriendose' = readStream nextLine.
	self assert: readStream atEnd
! !

	| elevatorConsole readStream |
	
	elevatorConsole := ElevatorConsole of: elevator.
		
	elevator goUpPushedFromFloor: 1.
	door closed.
			
	readStream := elevatorConsole consoleReadStream.

	self assert: 'Puerta Cerrandose' = readStream nextLine.
	self assert: 'Puerta Cerrada' = readStream nextLine.
	self assert: 'Cabina Moviendose' = readStream nextLine.
	self assert: readStream atEnd
! !

	| elevatorConsole readStream |
	
	elevatorConsole := ElevatorConsole of: elevator.
		
	elevator goUpPushedFromFloor: 1.
				
	readStream := elevatorConsole consoleReadStream.

	self assert: 'Puerta Cerrandose' = readStream nextLine.
	self assert: readStream atEnd! !
 
	| elevatorConsole readStream elevatorStatusView |
	
	elevatorConsole := ElevatorConsole of: elevator.
	elevatorStatusView := ElevatorStatusView of: elevator.
		
	elevator goUpPushedFromFloor: 1.
	door closed.
	cabin onFloor: 1.  
		
	readStream := elevatorConsole consoleReadStream.

	self assert: 'Puerta Cerrandose' = readStream nextLine.
	self assert: 'Puerta Cerrada' = readStream nextLine.
	self assert: 'Cabina Moviendose' = readStream nextLine.
	self assert: 'Cabina Detenida' = readStream nextLine.
	self assert: 'Puerta Abriendose' = readStream nextLine.
	self assert: readStream atEnd.

	self assert: 'Stopped' = elevatorStatusView cabinFieldModel.
	self assert: 'Opening' = elevatorStatusView cabinDoorFieldModel! !

	^elevator goUpPushedFromFloorWhenWorking: aFloorNumber ! !
	
	^true! !
	
	^false! !

	^self class motorMustBeStoppedBeforeMovingAgainErrorMessage
! !

	self error: self motorMustBeStoppedBeforeMovingAgainErrorMessage! !
	
	self assertIsNotMoving.
	
	state := #movingCounterClockwise! !
	
	self assertIsNotMoving.
	
	state := #movingClockwise! !
	
	state := #stopped! !

	state := #stopped! !
	
	^self isStopped not! !
	
	^state = #movingCounterClockwise ! !
	
	^state = #movingClockwise! !
	
	^state = #stopped! !
	
	self isMoving ifTrue: [ self signalMotorMustBeStoppedBeforeMovingAgain]! !

	^'El motor debe estar parado antes de que se empiece a mover'! !