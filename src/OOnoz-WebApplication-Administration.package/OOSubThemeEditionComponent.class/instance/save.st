actions
save
	[ self checkValidity.
	self subTheme theme addSubTheme: self subTheme.
	self subTheme theme save.
	self answer: true ]
		on: OOInvalidSubTheme , OOIndisponibleSubTheme
		do: [ :e | self hasBeenValidated: true ]