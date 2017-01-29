accessing
allActives
	^ self selectMany: [ :m | m isActivated ]