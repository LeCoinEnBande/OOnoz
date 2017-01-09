action
save
	[ self checkValidity.
	self theme save.
	self answer: true ]
		on: OOInvalidTheme , OOUnavailableTheme , OOInvalidSubTheme , OOUnavailableSubTheme
		do: [ :e | self hasBeenValidated: true ]