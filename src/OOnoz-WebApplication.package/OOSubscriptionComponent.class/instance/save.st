action
save
	[ self checkIfUserCanBeCreated.
	self sendSubscriptionEmail.
	self user save.
	self flag: #todo
	"self answer: true" ]
		on: Error
		do: [ :err | self hasBeenValidated: true ]