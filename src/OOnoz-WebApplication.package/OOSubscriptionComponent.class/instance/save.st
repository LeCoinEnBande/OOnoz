action
save
	[ self checkIfUserCanBeCreated.
	self sendSubscriptionEmail.
	self user save.
	self answer: true ]
		on: OOError
		do: [ :err | self hasBeenValidated: true ]