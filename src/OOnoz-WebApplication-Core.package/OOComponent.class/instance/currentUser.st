conveniance
currentUser
	self flag: #todo.	"This is only for Lot1 development."
	^ self isLogged
		ifTrue: [ self session user ]
		ifFalse: [ OOUser selectOne: [ :u | true ] ]