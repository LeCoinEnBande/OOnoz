instance creation
newInstance
	^ (OOMCQRate mcq: OOMCQ new user: OOUser new)
		rate: 3;
		yourself