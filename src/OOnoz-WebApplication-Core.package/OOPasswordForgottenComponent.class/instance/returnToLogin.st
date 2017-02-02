rendering
returnToLogin
	^ self shouldAnswer
		ifTrue: [ self answer ]
		ifFalse: [ self displayDefaultScreen ]