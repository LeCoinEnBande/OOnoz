accessing
isActivated: anObject
	self mcq ifNotNil: [ :m | m isActivated: anObject ]