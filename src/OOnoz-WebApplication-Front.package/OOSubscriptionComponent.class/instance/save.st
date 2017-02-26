actions
save
	[ self checkIfUserCanBeCreated.
	self sendSubscriptionEmail.
	self user save.
	self user: OOUser new.
	(self rootComponent instanceOf: OOWelcomePage) message: 'Inscription validée. Un email de confirmation vous a été envoyé.'.
	self displayDefaultScreen ]
		on: OOError
		do: [ :err | self hasBeenValidated: true ]