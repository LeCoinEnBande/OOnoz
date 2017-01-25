testing
isValid
	[ self mcq validateMCQ ]
		on: OOInvalidMCQ
		do: [ ^ false ].
	^ true