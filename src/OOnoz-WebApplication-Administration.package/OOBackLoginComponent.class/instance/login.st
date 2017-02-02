accessing
login
	(self user isLoggable and: [ self user can logToAdminApplication ])
		ifTrue: [ self logUser: self user.
			self answer: true ]
		ifFalse: [ self hasBeenValidated: true ]