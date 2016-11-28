development support
validate
	self title isEmptyOrNil
		ifTrue: [ self invalidate: 'Un titre est nécessaire.' ].
	self description isEmptyOrNil
		ifTrue: [ self invalidate: 'Une description est nécessaire.' ]