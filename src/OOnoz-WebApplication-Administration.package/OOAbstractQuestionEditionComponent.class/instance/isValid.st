testing
isValid
	[ self question validate ]
		on: OOInvalidQuestion
		do: [ ^ false ].
	^ true