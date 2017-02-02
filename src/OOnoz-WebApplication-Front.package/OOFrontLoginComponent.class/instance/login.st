accessing
login
	self user isLoggable
		ifTrue: [ self logUser: self user.
			self answer: true ]
		ifFalse: [ self hasBeenValidated: true ]