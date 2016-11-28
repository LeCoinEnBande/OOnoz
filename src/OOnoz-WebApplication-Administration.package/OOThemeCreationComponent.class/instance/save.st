action
save
	[ self checkValidity.
	self theme save.
	self answer: true ]
		on: OOInvalidTheme , OOIndisponibleTheme , OOInvalidSubTheme , OOIndisponibleSubTheme
		do: [ :e | self hasBeenValidated: true ]