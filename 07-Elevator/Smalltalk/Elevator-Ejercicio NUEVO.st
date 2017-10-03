Object subclass: #Cabin	instanceVariableNames: 'door state'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!Cabin methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:07'!isDoorClosing	^ door isClosing! !!Cabin methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:06'!isDoorOpen	^ door isOpen .! !!Cabin methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:07'!isDoorOpening	^ door isOpening.! !!Cabin methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:14'!isStopped	^ state isStopped! !!Cabin methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:08'!isCabinWaitingForPeople	^ state isWaiting! !!Cabin methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:07'!isDoorClosed	^ door isClosed.! !!Cabin methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:16'!isCabinMoving	^ state isMoving.! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:34'!cabinDoorOpened	door hasOpened.! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:17'!waitForPeopleTimedOut	door close.	state := state waitForPeopleTimedOut.! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:44'!closeCabinDoor	state class = CabinStateMoving 		ifFalse: [ door close ]! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:32'!cabinOnFloor: aFloorNumber	state := state cabinOnFloor: aFloorNumber.	(state class = CabinStateStopped) ifTrue: [ door open. ]! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:16'!cabinDoorOpenedWithNextFloor: aFloorNumber	door hasOpened.	state := state cabinDoorOpenedWithNextFloor: aFloorNumber! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:45'!goUpPushedFromFloor: aFloorNumber	state class = CabinStateWaiting		ifFalse: [ door close ].	state := state goUpPushedFromFloor: aFloorNumber! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:47'!openCabinDoor	state class = CabinStateMoving		ifFalse: [ door open ]! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:25'!cabinDoorClosed	door closed.	state := state cabinDoorClosed.! !!Cabin methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:15'!stopNowAtFloor: aFloorNumber	door open.	state := CabinStateWaiting at: aFloorNumber towards: (self targetFloorNumber )! !!Cabin methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:15'!floorNumber	^ state floorNumber.! !!Cabin methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 20:33'!targetFloorNumber	^ state targetFloorNumber.! !!Cabin methodsFor: 'initialization' stamp: 'JulianBayardo 10/2/2017 19:08'!initialize	door := Door new.	state := CabinStateStopped atFloor: 0.! !Object subclass: #CabinState	instanceVariableNames: 'floorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinState methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:25'!floorNumber	^ floorNumber .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:07'!isStopped	self subclassResponsibility .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:02'!isWaiting	self subclassResponsibility! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:02'!isMoving	self subclassResponsibility! !CabinState subclass: #CabinStateMoving	instanceVariableNames: 'targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateMoving methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:35'!closeCabinDoor	^ self.! !!CabinStateMoving methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 23:04'!cabinDoorClosed	(ElevatorEmergency new messageText: (ElevatorEmergency desynchronizedDoorSensor)) signal.! !!CabinStateMoving methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:00'!cabinOnFloor: aFloorNumber	| floorsMoved floorsUntilTargetAfterMovement floorsUntilTargetBeforeMovement |	floorsMoved := (aFloorNumber - self floorNumber) abs.	" If we are moving in units of more than one floor, it means we are breaking Bolzano's theorem!! "	floorsMoved > 1		ifTrue:			[ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ].	floorsUntilTargetAfterMovement := (aFloorNumber - self targetFloorNumber) abs.	floorsUntilTargetBeforeMovement := (self floorNumber - self targetFloorNumber) abs.	" If we are getting away from the target floor, it means that we are falling or going up more than we should "	floorsUntilTargetAfterMovement >= floorsUntilTargetBeforeMovement		ifTrue:			[ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ].	floorNumber := aFloorNumber.	self floorNumber = self targetFloorNumber		ifTrue: [ ^ CabinStateStopped atFloor: aFloorNumber ]		ifFalse: [ ^ self ]! !!CabinStateMoving methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:02'!openCabinDoor	^ self .! !!CabinStateMoving methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:44'!targetFloorNumber	^ targetFloorNumber .! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:22'!isStopped	^ false! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:03'!isWaiting	^ false! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:28'!isMoving	^ true.! !!CabinStateMoving methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 22:37'!initializeAt: aFloorNumber towards: aTargetFloorNumber	floorNumber := aFloorNumber.	targetFloorNumber := aTargetFloorNumber.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateMoving class	instanceVariableNames: ''!!CabinStateMoving class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 21:43'!at: aFloorNumber towards: aTargetFloorNumber	^ self new initializeAt: aFloorNumber towards: aTargetFloorNumber .! !CabinState subclass: #CabinStateStopped	instanceVariableNames: 'nextFloor targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:03'!closeCabinDoor	^ self! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:27'!openCabinDoor	^ self.! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:49'!cabinDoorOpenedWithNextFloor: aTargetFloorNumber	^ CabinStateWaiting at: self floorNumber towards: aTargetFloorNumber! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:49'!goUpPushedFromFloor: aFloorNumber	targetFloorNumber := aFloorNumber.	^ self! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:28'!cabinOnFloor: aFloorNumber	aFloorNumber = self floorNumber		ifFalse: [ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ].! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:49'!cabinDoorClosed	^ CabinStateMoving at: self floorNumber towards: targetFloorNumber! !!CabinStateStopped methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 21:06'!initializeAtFloor: aFloorNumber	floorNumber := aFloorNumber.! !!CabinStateStopped methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 20:03'!isWaiting	^ false! !!CabinStateStopped methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:12'!isStopped	^ true! !!CabinStateStopped methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:21'!isMoving	^ false.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateStopped class	instanceVariableNames: ''!!CabinStateStopped class methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:06'!atFloor: aFloorNumber	^ self new initializeAtFloor: aFloorNumber! !CabinState subclass: #CabinStateStoppedWaitingForDoor	instanceVariableNames: 'nextFloor targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateStoppedWaitingForDoor methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:27'!closeCabinDoor	^ self! !!CabinStateStoppedWaitingForDoor methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:27'!cabinOnFloor: aFloorNumber	aFloorNumber = self floorNumber		ifFalse: [ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ].! !!CabinStateStoppedWaitingForDoor methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:27'!goUpPushedFromFloor: aFloorNumber	targetFloorNumber := aFloorNumber.	^ self! !!CabinStateStoppedWaitingForDoor methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:27'!cabinDoorOpenedWithNextFloor: aTargetFloorNumber	^ CabinStateWaiting at: self floorNumber towards: aTargetFloorNumber! !!CabinStateStoppedWaitingForDoor methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:27'!openCabinDoor	^ self.! !!CabinStateStoppedWaitingForDoor methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:27'!cabinDoorClosed	^ CabinStateMoving at: self floorNumber towards: targetFloorNumber! !!CabinStateStoppedWaitingForDoor methodsFor: 'initialization' stamp: 'JulianBayardo 10/2/2017 21:27'!initializeAtFloor: aFloorNumber	floorNumber := aFloorNumber.! !!CabinStateStoppedWaitingForDoor methodsFor: 'initialization' stamp: 'JulianBayardo 10/2/2017 21:27'!initializeAtFloor: aFloorNumber towards: aTargetFloorNumber	floorNumber := aFloorNumber.	targetFloorNumber := aTargetFloorNumber! !!CabinStateStoppedWaitingForDoor methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 21:27'!isWaiting	^ false! !!CabinStateStoppedWaitingForDoor methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 21:27'!isStopped	^ true! !!CabinStateStoppedWaitingForDoor methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 21:27'!isMoving	^ false.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateStoppedWaitingForDoor class	instanceVariableNames: ''!!CabinStateStoppedWaitingForDoor class methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 21:28'!atFloor: aFloorNumber towards: aTargetFloorNumber	^ self new initializeAtFloor: aFloorNumber towards: aTargetFloorNumber! !CabinState subclass: #CabinStateWaiting	instanceVariableNames: 'targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateWaiting methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 23:29'!isStopped	^ true! !!CabinStateWaiting methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:04'!isWaiting	^ true! !!CabinStateWaiting methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:04'!isMoving	^ false! !!CabinStateWaiting methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 22:30'!targetFloorNumber	^ targetFloorNumber! !!CabinStateWaiting methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:34'!closeCabinDoor	^ self waitForPeopleTimedOut .! !!CabinStateWaiting methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:25'!waitForPeopleTimedOut	^ CabinStateStoppedWaitingForDoor atFloor: (self floorNumber) towards: (self targetFloorNumber).! !!CabinStateWaiting methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 22:26'!initializeAt: aFloorNumber towards: aTargetFloorNumber	floorNumber := aFloorNumber.	targetFloorNumber := aTargetFloorNumber .	! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateWaiting class	instanceVariableNames: ''!!CabinStateWaiting class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 22:25'!at: aFloorNumber towards: aTargetFloorNumber	^ self new initializeAt: aFloorNumber towards: aTargetFloorNumber .! !Object subclass: #Door	instanceVariableNames: 'state'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!Door methodsFor: 'initialization' stamp: 'JulianBayardo 10/2/2017 19:07'!initialize	state := DoorStateOpen new.! !!Door methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:14'!isOpen	^ state isOpen.! !!Door methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:22'!isOpening	^ state isOpening.! !!Door methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:23'!isClosed	^ state isClosed.! !!Door methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:23'!isClosing	^ state isClosing.! !!Door methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:50'!close	state := state close.! !!Door methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:51'!closed	state := state closed.! !!Door methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:51'!hasOpened	state := state hasOpened.! !!Door methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:37'!open	state := state open.! !Object subclass: #DoorState	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorState methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:57'!isClosing	self subclassResponsibility! !!DoorState methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:58'!isOpening	self subclassResponsibility! !!DoorState methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:57'!isOpen	self subclassResponsibility! !!DoorState methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 20:57'!isClosed	self subclassResponsibility! !DoorState subclass: #DoorStateClosed	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorStateClosed methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:29'!isClosing	^ false.! !!DoorStateClosed methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:28'!isOpening	^ false.! !!DoorStateClosed methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:28'!isOpen	^ false.! !!DoorStateClosed methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:29'!isClosed	^ true.! !!DoorStateClosed methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:30'!closed	(ElevatorEmergency new messageText: ElevatorEmergency desynchronizedDoorSensor) signal.! !!DoorStateClosed methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:39'!open	^ DoorStateOpening new.! !DoorState subclass: #DoorStateClosing	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorStateClosing methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:52'!closed	^ DoorStateClosed new.! !!DoorStateClosing methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:38'!open	^ DoorStateOpening new.! !!DoorStateClosing methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:23'!isClosing	^ true.! !!DoorStateClosing methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:22'!isOpening	^ false.! !!DoorStateClosing methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:21'!isOpen	^ false.! !!DoorStateClosing methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:23'!isClosed	^ false.! !DoorState subclass: #DoorStateOpen	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorStateOpen methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:52'!close	^ DoorStateClosing new.! !!DoorStateOpen methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:29'!closed	(ElevatorEmergency new messageText: ElevatorEmergency desynchronizedDoorSensor) signal.! !!DoorStateOpen methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:38'!open	^ self.! !!DoorStateOpen methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:35'!isClosing	^ false.! !!DoorStateOpen methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:35'!isOpening	^ false.! !!DoorStateOpen methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:15'!isOpen	^ true.! !!DoorStateOpen methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:35'!isClosed	^ false.! !DoorState subclass: #DoorStateOpening	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:37'!open	^ self! !!DoorStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:52'!hasOpened	^ DoorStateOpen new.! !!DoorStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:31'!closed	(ElevatorEmergency new messageText: ElevatorEmergency desynchronizedDoorSensor) signal.! !!DoorStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 20:26'!close	^ self.! !!DoorStateOpening methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:33'!isClosing	^ false.! !!DoorStateOpening methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:33'!isOpening	^ true.! !!DoorStateOpening methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:33'!isOpen	^ false.! !!DoorStateOpening methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:34'!isClosed	^ false.! !Object subclass: #ElevatorController	instanceVariableNames: 'state cabinState floorsToGo cabin'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorController methodsFor: 'initialization' stamp: 'JulianBayardo 10/2/2017 19:10'!initialize	floorsToGo := OrderedCollection new.	state := ElevatorIdle new.	cabin := Cabin new! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:10'!cabinDoorOpened	floorsToGo isEmpty		ifTrue: [ state := ElevatorIdle new.			cabin cabinDoorOpened ]		ifFalse: [ cabin cabinDoorOpenedWithNextFloor: floorsToGo removeFirst ]! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:13'!waitForPeopleTimedOut	cabin waitForPeopleTimedOut! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:49'!closeCabinDoor	state class = ElevatorWorking ifTrue: [ cabin closeCabinDoor ]! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:13'!openCabinDoor	cabin openCabinDoor! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:41'!cabinOnFloor: aFloorNumber	floorsToGo		remove: aFloorNumber		ifAbsent: [ cabin cabinOnFloor: aFloorNumber.			^ self ].	cabin stopNowAtFloor: aFloorNumber! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 21:49'!goUpPushedFromFloor: aFloorNumber	(state class = ElevatorIdle) ifTrue: [state := ElevatorWorking new.			cabin goUpPushedFromFloor: aFloorNumber]		ifFalse:[floorsToGo addLast: aFloorNumber].	^ self! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:10'!cabinDoorClosed	cabin cabinDoorClosed! !!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:10'!cabinFloorNumber	^ cabin floorNumber! !!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	^ state isIdle.! !!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	^ state isWorking.! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinMoving	^ cabin isCabinMoving! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinDoorClosed	^ cabin isDoorClosed! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinDoorOpening	^ cabin isDoorOpening! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinWaitingForPeople	^ cabin isCabinWaitingForPeople! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinDoorClosing	^ cabin isDoorClosing! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinDoorOpened	^ cabin isDoorOpen! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:09'!isCabinStopped	^ cabin isStopped.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ElevatorController class	instanceVariableNames: ''!!ElevatorController class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 20:59'!new	^ super new initialize.! !Error subclass: #ElevatorEmergency	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ElevatorEmergency class	instanceVariableNames: ''!!ElevatorEmergency class methodsFor: 'as yet unclassified' stamp: 'JulianBayardo 10/1/2017 22:55'!desynchronizedDoorSensor	^ 'Sensor de puerta desincronizado'! !!ElevatorEmergency class methodsFor: 'as yet unclassified' stamp: 'JulianBayardo 10/1/2017 22:55'!desynchronizedCabinSensor	^ 'Sensor de cabina desincronizado'! !Object subclass: #ElevatorState	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	self subclassResponsibility .! !!ElevatorState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	self subclassResponsibility .! !!ElevatorState methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 18:30'!onIdle: aClosureToExecuteWhenIdle onWorking: aClosureToExecuteWhenWorking	self subclassResponsibility .! !ElevatorState subclass: #ElevatorIdle	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorIdle methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	^ true! !!ElevatorIdle methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	^ false! !!ElevatorIdle methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 18:31'!onIdle: aClosure onWorking: _	^ aClosure value.! !TestCase subclass: #ElevatorTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test22ElevatorCompletesAllTheRequests
	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinOnFloor:1.
	elevatorController cabinDoorOpened.
	elevatorController waitForPeopleTimedOut.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:2.
	
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test23CabinHasToStopOnFloorsOnItsWayNoMatterHowTheyWellCalled

	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinOnFloor:1.
		
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test21CabinHasToStopOnTheFloorsOnItsWay
	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinOnFloor:1.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:51'!test24CabinHasToStopAndWaitForPeopleOnFloorsOnItsWayNoMatterHowTheyWellCalled

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinOnFloor:1.
	elevatorController cabinDoorOpened.
	elevatorController waitForPeopleTimedOut.
	
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:38'!test09RequestToGoUpAreEnqueueWhenRequestedWhenCabinIsMoving

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorOpened.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinWaitingForPeople.
	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test10CabinDoorStartClosingAfterWaitingForPeople

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorOpened.
	elevatorController waitForPeopleTimedOut.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test13CloseDoorDoesNothingWhenCabinIsMoving

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinMoving.
	self assert: elevatorController isCabinDoorClosed.

	elevatorController closeCabinDoor.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinMoving.
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test14CloseDoorDoesNothingWhenOpeningTheDoorToWaitForPeople

	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.

	elevatorController closeCabinDoor.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test12CloseDoorDoesNothingIfIdle

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController closeCabinDoor.

	self assert: elevatorController isIdle.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test11StopsWaitingForPeopleIfCloseDoorIsPressed

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorOpened.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinWaitingForPeople.
	self assert: elevatorController isCabinDoorOpened.

	elevatorController closeCabinDoor.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorClosing.
! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test05ElevatorGetsIdleWhenDoorGetOpened

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor: 1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor: 1.
	elevatorController cabinDoorOpened.
		
	self assert: elevatorController isIdle.
	self deny: elevatorController isWorking.
		
	self assert: elevatorController isCabinStopped.
	self deny: elevatorController isCabinMoving.

	self assert: elevatorController isCabinDoorOpened.
	self deny: elevatorController isCabinDoorOpening.
	self deny: elevatorController isCabinDoorClosing.
	self deny: elevatorController isCabinDoorClosed.
		
	self assert: elevatorController cabinFloorNumber = 1! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 17:57'!test03CabinStartsMovingWhenDoorGetsClosed

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	
	self deny: elevatorController isIdle.
	self assert: elevatorController isWorking.

	self deny: elevatorController isCabinStopped.
	self assert: elevatorController isCabinMoving.
	
	self deny: elevatorController isCabinDoorOpened.
	self deny: elevatorController isCabinDoorOpening.
	self deny: elevatorController isCabinDoorClosing.
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/10/2011 17:33'!test01ElevatorStartsIdleWithDoorOpenOnFloorZero

	| elevatorController |
		
	elevatorController := ElevatorController new.
		
	self assert: elevatorController isIdle.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpened.
	self assert: elevatorController cabinFloorNumber = 0
! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test04CabinStopsAndStartsOpeningDoorWhenGetsToDestination

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor: 1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor: 1.

	self deny: elevatorController isIdle.
	self assert: elevatorController isWorking.
	
	self assert: elevatorController isCabinStopped.
	self deny: elevatorController isCabinMoving.
			
	self deny: elevatorController isCabinDoorOpened.
	self assert: elevatorController isCabinDoorOpening.
	self deny: elevatorController isCabinDoorClosing.
	self deny: elevatorController isCabinDoorClosed.

	self assert: elevatorController cabinFloorNumber = 1
! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 17:53'!test02CabinDoorStartsClosingWhenElevatorGetsCalled

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor: 1.
	
	self deny: elevatorController isIdle.
	self assert: elevatorController isWorking.
	
	self assert: elevatorController isCabinStopped.
	self deny: elevatorController isCabinMoving.
	
	self deny: elevatorController isCabinDoorOpened.
	self deny: elevatorController isCabinDoorOpening.
	self assert: elevatorController isCabinDoorClosing.
	self deny: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:42'!test15ElevatorHasToEnterEmergencyIfStoppedAndOtherFloorSensorTurnsOn

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:48'!test19ElevatorHasToEnterEmergencyIfDoorClosedSensorTurnsOnWhenClosed

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	self 
		should: [elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:49'!test20ElevatorHasToEnterEmergencyIfDoorClosesWhenOpening
	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado'.]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:48'!test18ElevatorHasToEnterEmergencyIfDoorClosesAutomatically
	| elevatorController |
	elevatorController := ElevatorController new.
	
	self 
		should: [ elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test16ElevatorHasToEnterEmergencyIfFalling

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test17ElevatorHasToEnterEmergencyIfJumpsFloors

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:3.
	elevatorController cabinDoorClosed.
	self 
		should: [ elevatorController cabinOnFloor: 3 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:35'!test06DoorKeepsOpenedWhenOpeningIsRequested

	| elevatorController |
	elevatorController := ElevatorController new.
	
	self assert: elevatorController isCabinDoorOpened.
	
	elevatorController openCabinDoor.

	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:51'!test09DoorKeepsOpeneingWhenItIsOpeneing

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.

	elevatorController openCabinDoor.
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 6/16/2014 13:24'!test07DoorMustBeOpenedWhenCabinIsStoppedAndClosingDoors

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor:1.
		
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorClosing.
		
	elevatorController openCabinDoor.
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.
! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:36'!test08CanNotOpenDoorWhenCabinIsMoving

	| elevatorController |
	elevatorController := ElevatorController new.

	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinMoving.
	self assert: elevatorController isCabinDoorClosed.

	elevatorController openCabinDoor.
	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinMoving.
	self assert: elevatorController isCabinDoorClosed.! !ElevatorState subclass: #ElevatorWorking	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorWorking methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:02'!isIdle	^ false.! !!ElevatorWorking methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:02'!isWorking	^ true.! !!ElevatorWorking methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 18:31'!onIdle: _ onWorking: aClosure	^ aClosure value.! !