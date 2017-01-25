actions
save
	[ self checkIfUserCanBeCreated.
	self sendSubscriptionEmail.
	self user save.
	self displayDefaultScreen ]
		on: OOError
		do: [ :err | self hasBeenValidated: true ]