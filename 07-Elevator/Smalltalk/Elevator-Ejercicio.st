Object subclass: #CabinState	instanceVariableNames: 'floorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinState methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:25'!floorNumber	^ floorNumber .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:13'!isCabinMoving	self subclassResponsibility .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:09'!isDoorClosed	self subclassResponsibility .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:10'!isDoorClosing	self subclassResponsibility .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 23:30'!isCabinWaitingForPeople	self subclassResponsibility .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:07'!isStopped	self subclassResponsibility .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:10'!isDoorOpening	self subclassResponsibility .! !!CabinState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:07'!isDoorOpen	self subclassResponsibility .! !CabinState subclass: #CabinStateClosing	instanceVariableNames: 'targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateClosing methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:42'!targetFloorNumber	^ targetFloorNumber .! !!CabinStateClosing methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:30'!isCabinWaitingForPeople	^ self shouldBeImplemented! !!CabinStateClosing methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:01'!openCabinDoor	^ CabinStateOpening atFloor: (self floorNumber) .! !!CabinStateClosing methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 21:42'!cabinDoorClosed	^ CabinStateMoving at: (self floorNumber) towards: (self targetFloorNumber)! !!CabinStateClosing methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 21:41'!initializeAt: aFloorNumber towards: aTargetFloorNumber	floorNumber := aFloorNumber .	targetFloorNumber := aTargetFloorNumber .! !!CabinStateClosing methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:17'!isCabinMoving	^ false! !!CabinStateClosing methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:18'!isDoorClosing	^ true.! !!CabinStateClosing methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:18'!isDoorClosed	^ false .! !!CabinStateClosing methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:17'!isStopped	^ true! !!CabinStateClosing methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:18'!isDoorOpening	^ false.! !!CabinStateClosing methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:17'!isDoorOpen	^ false.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateClosing class	instanceVariableNames: ''!!CabinStateClosing class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 21:39'!at: aFloorNumber towards: aTargetFloorNumber	^ self new initializeAt: aFloorNumber towards: aTargetFloorNumber .! !CabinState subclass: #CabinStateMoving	instanceVariableNames: 'targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateMoving methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 22:37'!initializeAt: aFloorNumber towards: aTargetFloorNumber	floorNumber := aFloorNumber.	targetFloorNumber := aTargetFloorNumber.! !!CabinStateMoving methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 23:02'!cabinOnFloor: aFloorNumber	| floorsMoved floorsUntilTargetAfterMovement floorsUntilTargetBeforeMovement |	floorsMoved := (aFloorNumber - self floorNumber) abs.	" If we are moving in units of more than one floor, it means we are breaking Bolzano's theorem!! "	floorsMoved > 1		ifTrue: [ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ].	floorsUntilTargetAfterMovement := (aFloorNumber - self targetFloorNumber) abs.	floorsUntilTargetBeforeMovement := (self floorNumber - self targetFloorNumber) abs.	" If we are getting away from the target floor, it means that we are falling or going up more than we should "	floorsUntilTargetAfterMovement >= floorsUntilTargetBeforeMovement		ifTrue: [ (ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal ].	floorNumber := aFloorNumber.	self floorNumber = self targetFloorNumber		ifTrue: [ ^ CabinStateOpening atFloor: aFloorNumber ]		ifFalse: [ ^ self ]! !!CabinStateMoving methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:02'!openCabinDoor	^ self .! !!CabinStateMoving methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:35'!closeCabinDoor	^ self.! !!CabinStateMoving methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 23:04'!cabinDoorClosed	(ElevatorEmergency new messageText: (ElevatorEmergency desynchronizedDoorSensor)) signal.! !!CabinStateMoving methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:44'!targetFloorNumber	^ targetFloorNumber .! !!CabinStateMoving methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:30'!isCabinWaitingForPeople	^ self shouldBeImplemented! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:23'!isCabinMoving	^ true .! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:23'!isDoorClosing	^ false .! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:24'!isDoorClosed	^ true .! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:22'!isStopped	^ false! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:23'!isDoorOpening	^ false .! !!CabinStateMoving methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:23'!isDoorOpen	^ false .! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateMoving class	instanceVariableNames: ''!!CabinStateMoving class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 21:43'!at: aFloorNumber towards: aTargetFloorNumber	^ self new initializeAt: aFloorNumber towards: aTargetFloorNumber .! !CabinState subclass: #CabinStateOpening	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateOpening methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:30'!isCabinWaitingForPeople	^ self shouldBeImplemented! !!CabinStateOpening methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:31'!isCabinMoving	^ false.! !!CabinStateOpening methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:31'!isDoorClosing	^ false .! !!CabinStateOpening methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:32'!isDoorClosed	^ false.! !!CabinStateOpening methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:30'!isStopped	^ true .! !!CabinStateOpening methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:31'!isDoorOpening	^ true .! !!CabinStateOpening methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:31'!isDoorOpen	^ false .! !!CabinStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:25'!cabinDoorOpenedWithNextFloor: aTargetFloorNumber 	^ CabinStateWaiting at: (self floorNumber) towards: aTargetFloorNumber .! !!CabinStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:03'!openCabinDoor	^ self .! !!CabinStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 23:05'!cabinDoorClosed	(ElevatorEmergency new messageText: (ElevatorEmergency desynchronizedDoorSensor)) signal.! !!CabinStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:36'!closeCabinDoor	^ self .! !!CabinStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:58'!cabinOnFloor: aFloorNumber	(ElevatorEmergency new messageText: ElevatorEmergency desynchronizedCabinSensor) signal! !!CabinStateOpening methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:23'!cabinDoorOpened	^ CabinStateStopped atFloor: (self floorNumber).! !!CabinStateOpening methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 21:30'!initializeAtFloor: aFloorNumber	floorNumber := aFloorNumber.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateOpening class	instanceVariableNames: ''!!CabinStateOpening class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 21:30'!atFloor: aFloorNumber	^ self new initializeAtFloor: aFloorNumber .! !CabinState subclass: #CabinStateStopped	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateStopped methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:13'!isCabinMoving	^ false! !!CabinStateStopped methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:11'!isDoorClosing	^ false! !!CabinStateStopped methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:11'!isDoorClosed	^ false! !!CabinStateStopped methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:12'!isStopped	^ true! !!CabinStateStopped methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:11'!isDoorOpening	^ false! !!CabinStateStopped methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:12'!isDoorOpen	^ true! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 21:39'!goUpPushedFromFloor: aFloorNumber	^ CabinStateClosing at: (self floorNumber) towards: aFloorNumber .! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:27'!openCabinDoor	^ self.! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:34'!closeCabinDoor	^ self .! !!CabinStateStopped methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 23:03'!cabinDoorClosed	(ElevatorEmergency new messageText: (ElevatorEmergency desynchronizedDoorSensor)) signal.! !!CabinStateStopped methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 21:06'!initializeAtFloor: aFloorNumber	floorNumber := aFloorNumber.! !!CabinStateStopped methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:30'!isCabinWaitingForPeople	^ self shouldBeImplemented! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateStopped class	instanceVariableNames: ''!!CabinStateStopped class methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:06'!atFloor: aFloorNumber	^ self new initializeAtFloor: aFloorNumber! !CabinState subclass: #CabinStateWaiting	instanceVariableNames: 'targetFloorNumber'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!CabinStateWaiting methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:34'!closeCabinDoor	^ self waitForPeopleTimedOut .! !!CabinStateWaiting methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:29'!waitForPeopleTimedOut	^ CabinStateClosing at: (self floorNumber) towards: (self targetFloorNumber)! !!CabinStateWaiting methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:26'!isCabinMoving	^ self shouldBeImplemented! !!CabinStateWaiting methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:28'!isDoorClosed	^ false.! !!CabinStateWaiting methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:28'!isDoorClosing	^ false.! !!CabinStateWaiting methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:30'!isCabinWaitingForPeople	^ true! !!CabinStateWaiting methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 22:30'!targetFloorNumber	^ targetFloorNumber! !!CabinStateWaiting methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:29'!isDoorOpening	^ false! !!CabinStateWaiting methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 23:29'!isStopped	^ true! !!CabinStateWaiting methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 22:26'!initializeAt: aFloorNumber towards: aTargetFloorNumber	floorNumber := aFloorNumber.	targetFloorNumber := aTargetFloorNumber .	! !!CabinStateWaiting methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 22:27'!isDoorOpen	^ true.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!CabinStateWaiting class	instanceVariableNames: ''!!CabinStateWaiting class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 22:25'!at: aFloorNumber towards: aTargetFloorNumber	^ self new initializeAt: aFloorNumber towards: aTargetFloorNumber .! !Object subclass: #ElevatorController	instanceVariableNames: 'state cabinState floorsToGo'	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:05'!cabinFloorNumber	^ cabinState floorNumber.! !!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	^ state isIdle.! !!ElevatorController methodsFor: 'accessing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	^ state isWorking.! !!ElevatorController methodsFor: 'initialization' stamp: 'JulianBayardo 10/1/2017 23:08'!initialize	floorsToGo := OrderedCollection new.	state := ElevatorIdle new.	cabinState := CabinStateStopped atFloor: 0! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:15'!goUpPushedFromFloor: aFloorNumber	(self isWorking)		ifTrue: [			floorsToGo addLast: aFloorNumber.			]		ifFalse: [			state := ElevatorWorking new.			cabinState := cabinState goUpPushedFromFloor: aFloorNumber. ].! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 21:20'!cabinDoorClosed	cabinState := cabinState cabinDoorClosed! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:00'!openCabinDoor	cabinState := cabinState openCabinDoor.! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:33'!closeCabinDoor	cabinState := cabinState closeCabinDoor.! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:28'!waitForPeopleTimedOut	cabinState := cabinState waitForPeopleTimedOut.! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 23:23'!cabinOnFloor: aFloorNumber	floorsToGo		remove: aFloorNumber		ifAbsent: [			cabinState := cabinState cabinOnFloor: aFloorNumber.			^ self.			].		floorsToGo addFirst: cabinState targetFloorNumber.	cabinState := CabinStateOpening atFloor: aFloorNumber.! !!ElevatorController methodsFor: 'sensors' stamp: 'JulianBayardo 10/1/2017 22:22'!cabinDoorOpened	floorsToGo isEmpty		ifTrue: [			state := ElevatorIdle new.			cabinState := cabinState cabinDoorOpened. ]		ifFalse: [			cabinState := cabinState cabinDoorOpenedWithNextFloor: (floorsToGo removeFirst). ].! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:13'!isCabinMoving	^ cabinState isCabinMoving .! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:09'!isCabinDoorClosing	^ cabinState isDoorClosing.! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:09'!isCabinDoorClosed	^ cabinState isDoorClosed.! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 22:26'!isCabinWaitingForPeople	^ cabinState isCabinWaitingForPeople .! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:07'!isCabinDoorOpened	^ cabinState isDoorOpen.! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:07'!isCabinStopped	^ cabinState isStopped.! !!ElevatorController methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:08'!isCabinDoorOpening	^ cabinState isDoorOpening.! !"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ElevatorController class	instanceVariableNames: ''!!ElevatorController class methodsFor: 'instance creation' stamp: 'JulianBayardo 10/1/2017 20:59'!new	^ super new initialize.! !Error subclass: #ElevatorEmergency	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!ElevatorEmergency class	instanceVariableNames: ''!!ElevatorEmergency class methodsFor: 'as yet unclassified' stamp: 'JulianBayardo 10/1/2017 22:55'!desynchronizedDoorSensor	^ 'Sensor de puerta desincronizado'! !!ElevatorEmergency class methodsFor: 'as yet unclassified' stamp: 'JulianBayardo 10/1/2017 22:55'!desynchronizedCabinSensor	^ 'Sensor de cabina desincronizado'! !Object subclass: #ElevatorState	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	self subclassResponsibility .! !!ElevatorState methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	self subclassResponsibility .! !ElevatorState subclass: #ElevatorIdle	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorIdle methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isIdle	^ true! !!ElevatorIdle methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:01'!isWorking	^ false! !TestCase subclass: #ElevatorTest	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test22ElevatorCompletesAllTheRequests
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
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 5' stamp: 'HernanWilkinson 7/10/2011 17:50'!test21CabinHasToStopOnTheFloorsOnItsWay
	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinOnFloor:1.

	self assert: elevatorController isWorking.
	self assert: elevatorController isCabinStopped.
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test04CabinStopsAndStartsOpeningDoorWhenGetsToDestination

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
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/15/2011 18:00'!test05ElevatorGetsIdleWhenDoorGetOpened

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
		
	self assert: elevatorController cabinFloorNumber = 1! !!ElevatorTest methodsFor: 'tests 1' stamp: 'HernanWilkinson 7/10/2011 17:33'!test01ElevatorStartsIdleWithDoorOpenOnFloorZero

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
	self deny: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:42'!test15ElevatorHasToEnterEmergencyIfStoppedAndOtherFloorSensorTurnsOn

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado' ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test16ElevatorHasToEnterEmergencyIfFalling

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:2.
	elevatorController cabinDoorClosed.
	elevatorController cabinOnFloor:1.
	self 
		should: [ elevatorController cabinOnFloor:0 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:48'!test19ElevatorHasToEnterEmergencyIfDoorClosedSensorTurnsOnWhenClosed

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:1.
	elevatorController cabinDoorClosed.
	self 
		should: [elevatorController cabinDoorClosed.]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:47'!test17ElevatorHasToEnterEmergencyIfJumpsFloors

	| elevatorController |
	elevatorController := ElevatorController new.
	
	elevatorController goUpPushedFromFloor:3.
	elevatorController cabinDoorClosed.
	self 
		should: [ elevatorController cabinOnFloor: 3 ]
		raise: ElevatorEmergency 
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de cabina desincronizado'. ]! !!ElevatorTest methodsFor: 'tests 4' stamp: 'HernanWilkinson 7/10/2011 17:49'!test20ElevatorHasToEnterEmergencyIfDoorClosesWhenOpening
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
		withExceptionDo: [ :elevatorEmergency | self assert: elevatorEmergency messageText = 'Sensor de puerta desincronizado' ]! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test13CloseDoorDoesNothingWhenCabinIsMoving

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
	self assert: elevatorController isCabinDoorClosed.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test11StopsWaitingForPeopleIfCloseDoorIsPressed

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
! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:39'!test10CabinDoorStartClosingAfterWaitingForPeople

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
	self assert: elevatorController isCabinDoorClosing.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:40'!test14CloseDoorDoesNothingWhenOpeningTheDoorToWaitForPeople

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
	self assert: elevatorController isCabinDoorOpening.! !!ElevatorTest methodsFor: 'tests 3' stamp: 'HernanWilkinson 7/10/2011 17:38'!test09RequestToGoUpAreEnqueueWhenRequestedWhenCabinIsMoving

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
	self assert: elevatorController isCabinDoorOpened.! !!ElevatorTest methodsFor: 'tests 2' stamp: 'HernanWilkinson 7/10/2011 17:35'!test06DoorKeepsOpenedWhenOpeningIsRequested

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
	self assert: elevatorController isCabinDoorClosed.! !ElevatorState subclass: #ElevatorWorking	instanceVariableNames: ''	classVariableNames: ''	poolDictionaries: ''	category: 'Elevator-Ejercicio'!!ElevatorWorking methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:02'!isIdle	^ false.! !!ElevatorWorking methodsFor: 'testing' stamp: 'JulianBayardo 10/1/2017 21:02'!isWorking	^ true.! !