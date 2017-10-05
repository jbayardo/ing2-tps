Object subclass: #Cabin	instanceVariableNames: 'door state controller'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!Cabin methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:42'!doorOpenedSensorActivated	state := state doorOpenedSensorActivated! !!Cabin methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:41'!doorCloseButtonPressed	state := state doorCloseButtonPressed! !!Cabin methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:42'!doorClosedSensorActivated	state := state doorClosedSensorActivated! !!Cabin methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:41'!doorOpenButtonPressed	state := state doorOpenButtonPressed! !!Cabin methodsFor: 'cabin sensors' stamp: 'JulianBayardo 10/3/2017 01:08'!onFloor: aFloorNumber	state := state onFloor: aFloorNumber.! !!Cabin methodsFor: 'cabin sensors' stamp: 'JulianBayardo 10/3/2017 01:10'!requestedFrom: aFloorNumber	state := state requestedFrom: aFloorNumber! !!Cabin methodsFor: 'cabin sensors' stamp: 'JulianBayardo 10/3/2017 01:36'!waitForPeopleTimedOut	state := state waitForPeopleTimedOut! !!Cabin methodsFor: 'door testing' stamp: 'JB 10/2/2017 23:43:42'!isDoorOpen
	^ door isDoorOpen.! !!Cabin methodsFor: 'door testing' stamp: 'JB 10/2/2017 23:43:32'!isDoorClosing
	^ door isDoorClosing.! !!Cabin methodsFor: 'door testing' stamp: 'JB 10/2/2017 23:43:55'!isDoorOpening
	^ door isDoorOpening.! !!Cabin methodsFor: 'door testing' stamp: 'JB 10/2/2017 23:43:18'!isDoorClosed
	^ door isDoorClosed.! !!Cabin methodsFor: 'initialization' stamp: 'JulianBayardo 10/3/2017 00:38'!initializeWithController: anElevatorController	door := Door new.	state := CabinStateStopped for: self at: 0.	controller := anElevatorController! !!Cabin methodsFor: 'cabin testing' stamp: 'JB 10/2/2017 23:41:23'!isCabinStopped
	^ state isCabinStopped.! !!Cabin methodsFor: 'cabin testing' stamp: 'JB 10/2/2017 23:41:39'!isCabinWaitingForPeople
	^ state isCabinWaiting.! !!Cabin methodsFor: 'cabin testing' stamp: 'JB 10/2/2017 23:41:04'!isCabinMoving
	^ state isCabinMoving.! !!Cabin methodsFor: 'cabin accessing' stamp: 'JulianBayardo 10/2/2017 19:15'!floorNumber	^ state floorNumber.! !!Cabin methodsFor: 'cabin accessing' stamp: 'JulianBayardo 10/3/2017 00:26'!door	^ door.! !!Cabin methodsFor: 'cabin accessing' stamp: 'JulianBayardo 10/2/2017 20:33'!targetFloorNumber	^ state targetFloorNumber.! !!Cabin methodsFor: 'cabin accessing' stamp: 'JulianBayardo 10/3/2017 00:55'!controller	^ controller! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!Cabin class	instanceVariableNames: ''!!Cabin class methodsFor: 'as yet unclassified' stamp: 'JulianBayardo 10/3/2017 00:35'!withController: anElevatorController	^ self new initializeWithController: anElevatorController .! !Object subclass: #CabinState	instanceVariableNames: 'floorNumber cabin'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinState methodsFor: 'cabin testing' stamp: 'JulianBayardo 10/3/2017 02:10'!isCabinMoving	^ false.! !!CabinState methodsFor: 'cabin testing' stamp: 'JulianBayardo 10/3/2017 02:10'!isCabinWaiting	^ false.! !!CabinState methodsFor: 'cabin testing' stamp: 'JulianBayardo 10/3/2017 02:10'!isCabinStopped	^ false.! !!CabinState methodsFor: 'initialization' stamp: 'JulianBayardo 10/3/2017 00:40'!initializeFor: aCabin	cabin := aCabin.	^ self.! !!CabinState methodsFor: 'cabin accessing' stamp: 'JulianBayardo 10/3/2017 00:39'!cabin	^ cabin! !!CabinState methodsFor: 'cabin accessing' stamp: 'JulianBayardo 10/1/2017 23:25'!floorNumber	^ floorNumber .! !!CabinState methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:42'!doorOpenedSensorActivated	self cabin door doorOpenedSensorActivated.	^ self.! !!CabinState methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:41'!doorCloseButtonPressed	self cabin door doorCloseButtonPressed.	^ self.! !!CabinState methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:42'!doorClosedSensorActivated	self cabin door doorClosedSensorActivated.	^ self.! !!CabinState methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:41'!doorOpenButtonPressed	self cabin door doorOpenButtonPressed.	^ self.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinState class	instanceVariableNames: ''!!CabinState class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/3/2017 00:40'!for: aCabin	^ self new initializeFor: aCabin.! !CabinState subclass: #CabinStateMoving	instanceVariableNames: 'targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateMoving methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:04'!doorCloseButtonPressed! !!CabinStateMoving methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 01:05'!doorOpenButtonPressed	! !!CabinStateMoving methodsFor: 'cabin testing' stamp: 'JB 10/2/2017 23:41:04'!isCabinMoving
	^ true.! !!CabinStateMoving methodsFor: 'cabin accessing' stamp: 'JulianBayardo 10/1/2017 21:44'!targetFloorNumber	^ targetFloorNumber .! !!CabinStateMoving methodsFor: 'initialization' stamp: 'JulianBayardo 10/3/2017 00:40'!initializeAt: aFloorNumber towards: aTargetFloorNumber	floorNumber := aFloorNumber.	targetFloorNumber := aTargetFloorNumber! !!CabinStateMoving methodsFor: 'cabin sensors' stamp: 'JulianBayardo 10/3/2017 01:53'!onFloor: aFloorNumber	| floorsMoved floorsUntilTargetAfterMovement floorsUntilTargetBeforeMovement |	floorsMoved := (aFloorNumber - self floorNumber) abs.	" If we are moving in units of more than one floor, it means we are breaking Bolzano's theorem!! "	floorsMoved > 1		ifTrue:			[ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ].	floorsUntilTargetAfterMovement := (aFloorNumber - self targetFloorNumber) abs.	floorsUntilTargetBeforeMovement := (self floorNumber - self targetFloorNumber) abs.	" If we are getting away from the target floor, it means that we are falling or going up more than we should "	floorsUntilTargetAfterMovement >= floorsUntilTargetBeforeMovement		ifTrue:			[ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ].	floorNumber := aFloorNumber.	" All correctness checks have passed. Check if we should stop. "	(self cabin controller hasPendingFloor: aFloorNumber)		ifTrue: [			self cabin controller markAsDone: aFloorNumber.			self cabin door doorOpenButtonPressed.			^ CabinStateWaiting for: self cabin at: aFloorNumber towards: self targetFloorNumber .			 ].			" Check if we arrived or not "	self floorNumber = self targetFloorNumber		ifFalse: [ ^ self ].	self cabin door doorOpenButtonPressed.	^ CabinStateStopped for: self cabin at: aFloorNumber! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateMoving class	instanceVariableNames: ''!!CabinStateMoving class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/3/2017 00:41'!for: aCabin at: aFloorNumber towards: aTargetFloorNumber	^ (self for: aCabin) initializeAt: aFloorNumber towards: aTargetFloorNumber! !CabinState subclass: #CabinStateStopped	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateStopped methodsFor: 'cabin sensors' stamp: 'JulianBayardo 10/3/2017 01:08'!onFloor: aFloorNumber	aFloorNumber = self floorNumber		ifFalse:			[ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ]. self cabin door				doorOpenButtonPressed! !!CabinStateStopped methodsFor: 'cabin sensors' stamp: 'JulianBayardo 10/3/2017 01:35'!requestedFrom: aFloorNumber	" This is called when a request is made and the elevator has been idle. "	self cabin door doorCloseButtonPressed.	" The Waiting state will go into Moving when the door is sensed to be closed "	^ CabinStateWaiting for: self cabin at: self floorNumber towards: aFloorNumber! !!CabinStateStopped methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 21:06'!initializeAtFloor: aFloorNumber	floorNumber := aFloorNumber.! !!CabinStateStopped methodsFor: 'cabin testing' stamp: 'JB 10/2/2017 23:41:23'!isCabinStopped
	^ true.! !!CabinStateStopped methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 02:07'!doorOpenedSensorActivated	" This is called when the door has just opened on a newly arrived floor. "	| nextFloor |	super doorOpenedSensorActivated.	nextFloor := self cabin controller nextFloor.	nextFloor isNil		ifFalse: [ ^ CabinStateWaiting for: self cabin at: self floorNumber towards: nextFloor ].		self cabin controller setToIdle.	^ self! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateStopped class	instanceVariableNames: ''!!CabinStateStopped class methodsFor: 'accessing' stamp: 'JulianBayardo 10/3/2017 00:42'!for: aCabin at: aFloorNumber	^ (self for: aCabin) initializeAtFloor: aFloorNumber! !CabinState subclass: #CabinStateWaiting	instanceVariableNames: 'targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateWaiting methodsFor: 'cabin accessing' stamp: 'JulianBayardo 10/1/2017 22:30'!targetFloorNumber	^ targetFloorNumber! !!CabinStateWaiting methodsFor: 'cabin testing' stamp: 'JB 10/2/2017 23:41:39'!isCabinWaiting
	^ true.! !!CabinStateWaiting methodsFor: 'cabin testing' stamp: 'JulianBayardo 10/3/2017 02:11'!isCabinStopped	^ true! !!CabinStateWaiting methodsFor: 'initialization' stamp: 'JulianBayardo 10/3/2017 00:24'!initializeAtFloor: aFloorNumber towards: aTargetFloorNumber	floorNumber := aFloorNumber.	targetFloorNumber := aTargetFloorNumber .	! !!CabinStateWaiting methodsFor: 'cabin sensors' stamp: 'JulianBayardo 10/3/2017 01:37'!waitForPeopleTimedOut	self cabin door doorCloseButtonPressed.	^ self! !!CabinStateWaiting methodsFor: 'door sensors' stamp: 'JulianBayardo 10/3/2017 02:12'!doorClosedSensorActivated	super doorClosedSensorActivated.	^ CabinStateMoving for: self cabin at: self floorNumber towards: self targetFloorNumber! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateWaiting class	instanceVariableNames: ''!!CabinStateWaiting class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/3/2017 00:44'!for: aCabin at: aFloorNumber towards: aTargetFloorNumber	^ (self for: aCabin) initializeAtFloor: aFloorNumber towards: aTargetFloorNumber! !Object subclass: #Door	instanceVariableNames: 'state'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!Door methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:42'!isDoorOpen
	^ state isDoorOpen.! !!Door methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:32'!isDoorClosing
	^ state isDoorClosing.! !!Door methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:55'!isDoorOpening
	^ state isDoorOpening.! !!Door methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:18'!isDoorClosed
	^ state isDoorClosed.! !!Door methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenedSensorActivated
	state := state doorOpenedSensorActivated.! !!Door methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:09'!doorCloseButtonPressed
	state := state doorCloseButtonPressed.! !!Door methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:09'!doorClosedSensorActivated
	state := state doorClosedSensorActivated.! !!Door methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenButtonPressed
	state := state doorOpenButtonPressed.! !!Door methodsFor: 'initialization' stamp: 'JulianBayardo 10/2/2017 19:07'!initialize	state := DoorStateOpen new.! !Object subclass: #DoorState	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorState methodsFor: 'testing' stamp: 'JulianBayardo 10/3/2017 00:09'!doorClosedSensorActivated" Por defecto, lecturas de los sensores son consideradas errores"	(ElevatorEmergency new messageText: ElevatorEmergency desynchronizedDoorSensor) signal! !!DoorState methodsFor: 'testing' stamp: 'JulianBayardo 10/3/2017 00:09'!doorCloseButtonPressed	" Por defecto, lecturas de los sensores son consideradas errores"	(ElevatorEmergency new messageText: ElevatorEmergency desynchronizedDoorSensor) signal! !!DoorState methodsFor: 'testing' stamp: 'JB 10/2/2017 23:43:17'!isDoorClosed
	self subclassResponsibility.! !!DoorState methodsFor: 'testing' stamp: 'JB 10/2/2017 23:43:42'!isDoorOpen
	self subclassResponsibility.! !!DoorState methodsFor: 'testing' stamp: 'JB 10/2/2017 23:43:55'!isDoorOpening
	self subclassResponsibility.! !!DoorState methodsFor: 'testing' stamp: 'JB 10/2/2017 23:43:31'!isDoorClosing
	self subclassResponsibility.! !!DoorState methodsFor: 'testing' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenButtonPressed	" Por defecto, lecturas de los sensores son consideradas errores"	(ElevatorEmergency new messageText: ElevatorEmergency desynchronizedDoorSensor) signal! !!DoorState methodsFor: 'testing' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenedSensorActivated	" Por defecto, lecturas de los sensores son consideradas errores"	(ElevatorEmergency new messageText: ElevatorEmergency desynchronizedDoorSensor) signal! !DoorState subclass: #DoorStateClosed	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorStateClosed methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:42'!isDoorOpen
	^ false.! !!DoorStateClosed methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:31'!isDoorClosing
	^ false.! !!DoorStateClosed methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:55'!isDoorOpening
	^ false.! !!DoorStateClosed methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:17'!isDoorClosed
	^ true.! !!DoorStateClosed methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenButtonPressed
	^ DoorStateOpening new.! !DoorState subclass: #DoorStateClosing	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorStateClosing methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:09'!doorClosedSensorActivated
	^ DoorStateClosed new.! !!DoorStateClosing methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenButtonPressed
	^ DoorStateOpening new.! !!DoorStateClosing methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:42'!isDoorOpen
	^ false.! !!DoorStateClosing methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:32'!isDoorClosing
	^ true.! !!DoorStateClosing methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:55'!isDoorOpening
	^ false.! !!DoorStateClosing methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:18'!isDoorClosed
	^ false.! !DoorState subclass: #DoorStateOpen	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorStateOpen methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:42'!isDoorOpen
	^ true.! !!DoorStateOpen methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:31'!isDoorClosing
	^ false.! !!DoorStateOpen methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:55'!isDoorOpening
	^ false.! !!DoorStateOpen methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:18'!isDoorClosed
	^ false.! !!DoorStateOpen methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:09'!doorCloseButtonPressed
	^ DoorStateClosing new.! !!DoorStateOpen methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenButtonPressed
	^ self.! !DoorState subclass: #DoorStateOpening	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!DoorStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenedSensorActivated
	^ DoorStateOpen new.! !!DoorStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:09'!doorCloseButtonPressed
	^ self.! !!DoorStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:10'!doorOpenButtonPressed
	^ self.! !!DoorStateOpening methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:42'!isDoorOpen
	^ false.! !!DoorStateOpening methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:31'!isDoorClosing
	^ false.! !!DoorStateOpening methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:55'!isDoorOpening
	^ true.! !!DoorStateOpening methodsFor: 'accessing' stamp: 'JB 10/2/2017 23:43:17'!isDoorClosed
	^ false.! !Object subclass: #ElevatorController	instanceVariableNames: 'state cabinState floorsToGo cabin'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	^ state isWorking.! !!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 19:10'!cabinFloorNumber	^ cabin floorNumber! !!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	^ state isIdle.! !!ElevatorController methodsFor: 'sensors' stamp: 'DamianFurman 10/5/2017 12:16'!goUpPushedFromFloor: aFloorNumber	state := state goUpPushedFromFloor: aFloorNumber toCabin: cabin withFloorsToGo: floorsToGo .	^ self! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:09'!cabinDoorClosed	cabin doorClosedSensorActivated! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 00:10'!openCabinDoor	cabin doorOpenButtonPressed! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/2/2017 19:13'!waitForPeopleTimedOut	cabin waitForPeopleTimedOut! !!ElevatorController methodsFor: 'sensors' stamp: 'DamianFurman 10/5/2017 12:04'!closeCabinDoor	state doorCloseOnlyIfWorking: cabin .! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 01:48'!cabinOnFloor: aFloorNumber	cabin onFloor: aFloorNumber! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/3/2017 02:07'!cabinDoorOpened	cabin doorOpenedSensorActivated! !!ElevatorController methodsFor: 'floor management' stamp: 'JulianBayardo 10/3/2017 01:57'!hasPendingFloor: aFloorNumber	^ floorsToGo includes: aFloorNumber! !!ElevatorController methodsFor: 'floor management' stamp: 'JulianBayardo 10/3/2017 02:07'!setToIdle	state := ElevatorIdle new.! !!ElevatorController methodsFor: 'floor management' stamp: 'JulianBayardo 10/3/2017 02:08'!markAsDone: aFloorNumber	" Esto es para manejar repetidos. Necesitamos que sea ordenada para respetar el orden de llamadas. "	floorsToGo removeAllSuchThat: [ :each | each = aFloorNumber ]! !!ElevatorController methodsFor: 'floor management' stamp: 'JulianBayardo 10/3/2017 00:57'!nextFloor	floorsToGo isEmpty		ifTrue: [ ^ nil ]		ifFalse: [ ^ floorsToGo removeFirst ]! !!ElevatorController methodsFor: 'initialization' stamp: 'JulianBayardo 10/3/2017 00:34'!initialize	floorsToGo := OrderedCollection new.	state := ElevatorIdle new.	cabin := Cabin withController: self.! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinDoorOpened	^ cabin isDoorOpen! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinMoving	^ cabin isCabinMoving! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinDoorClosing	^ cabin isDoorClosing! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinDoorOpening	^ cabin isDoorOpening! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinDoorClosed	^ cabin isDoorClosed! !!ElevatorController methodsFor: 'testing' stamp: 'JB 10/2/2017 23:41:23'!isCabinStopped
	^ cabin isCabinStopped.! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/2/2017 19:13'!isCabinWaitingForPeople	^ cabin isCabinWaitingForPeople! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ElevatorController class	instanceVariableNames: ''!!ElevatorController class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 20:59'!new	^ super new initialize.! !Error subclass: #ElevatorEmergency	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ElevatorEmergency class	instanceVariableNames: ''!!ElevatorEmergency class methodsFor: 'as yet unclassified' stamp: 'JulianBayardo 10/1/2017 22:55'!desynchronizedCabinSensor	^ 'Sensor de cabina desincronizado'! !!ElevatorEmergency class methodsFor: 'as yet unclassified' stamp: 'JulianBayardo 10/1/2017 22:55'!desynchronizedDoorSensor	^ 'Sensor de puerta desincronizado'! !Object subclass: #ElevatorState	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	self subclassResponsibility .! !!ElevatorState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	self subclassResponsibility .! !!ElevatorState methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 18:30'!onIdle: aClosureToExecuteWhenIdle onWorking: aClosureToExecuteWhenWorking	self subclassResponsibility .! !ElevatorState subclass: #ElevatorIdle	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorIdle methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	^ false! !!ElevatorIdle methodsFor: 'testing' stamp: 'DamianFurman 10/5/2017 12:05'!doorCloseOnlyIfWorking: aCabin! !!ElevatorIdle methodsFor: 'testing' stamp: 'DamianFurman 10/5/2017 12:13'!goUpPushedFromFloor: aFloorNumber toCabin: aCabin withFloorsToGo: someFloorsToGo			aCabin requestedFrom: aFloorNumber .			^ ElevatorWorking new.! !!ElevatorIdle methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	^ true! !!ElevatorIdle methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 23:33'!onIdle: aClosure onWorking: anotherClosure	^ aClosure value! !TestCase subclass: #ElevatorTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:51'!test09DoorKeepsOpeneingWhenItIsOpeneing

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
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:35'!test06DoorKeepsOpenedWhenOpeningIsRequested

	| elevatorController |
	elevatorController := ElevatorController new.
	
	self assert: elevatorController isCabinDoorOpened.
	
	elevatorController openCabinDoor.

	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test05ElevatorGetsIdleWhenDoorGetOpened

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
		
	self assert: elevatorController cabinFloorNumber = 1! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test04CabinStopsAndStartsOpeningDoorWhenGetsToDestination

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
! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 17:57'!test03CabinStartsMovingWhenDoorGetsClosed

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
	self deny: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:38'!test09RequestToGoUpAreEnqueueWhenRequestedWhenCabinIsMoving

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorOpened.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinWaitingForPeople.
	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test12CloseDoorDoesNothingIfIdle

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
! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test14CloseDoorDoesNothingWhenOpeningTheDoorToWaitForPeople

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
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test13CloseDoorDoesNothingWhenCabinIsMoving

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
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test10CabinDoorStartClosingAfterWaitingForPeople

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
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:42'!test15ElevatorHasToEnterEmergencyIfStoppedAndOtherFloorSensorTurnsOn

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:49'!test20ElevatorHasToEnterEmergencyIfDoorClosesWhenOpening
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
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:48'!test19ElevatorHasToEnterEmergencyIfDoorClosedSensorTurnsOnWhenClosed

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	self 
		should: [elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test16ElevatorHasToEnterEmergencyIfFalling

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
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test23CabinHasToStopOnFloorsOnItsWayNoMatterHowTheyWellCalled

	| elevatorController |
	elevatorController := ElevatorController new.
		
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:1.
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
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test22ElevatorCompletesAllTheRequests
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
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test21CabinHasToStopOnTheFloorsOnItsWay
	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinOnFloor:1.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !ElevatorState subclass: #ElevatorWorking	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorWorking methodsFor: 'accessing' stamp: 'JulianBayardo 10/2/2017 23:34'!onIdle: anotherClosure onWorking: aClosure	^ aClosure value! !!ElevatorWorking methodsFor: 'testing' stamp: 'DamianFurman 10/5/2017 12:05'!doorCloseOnlyIfWorking: aCabin			aCabin doorCloseButtonPressed .! !!ElevatorWorking methodsFor: 'testing' stamp: 'DamianFurman 10/5/2017 12:16'!goUpPushedFromFloor: aFloorNumber toCabin: aCabin withFloorsToGo: someFloorsToGo	someFloorsToGo addLast: aFloorNumber .! !!ElevatorWorking methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:02'!isIdle	^ false.! !!ElevatorWorking methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:02'!isWorking	^ true.! !