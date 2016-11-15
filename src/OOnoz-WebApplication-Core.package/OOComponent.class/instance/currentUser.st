conveniance
currentUser
	self flag: #todo. "This is only for Lot1 development."
	^ OOUser selectOne: [ :u | true ]