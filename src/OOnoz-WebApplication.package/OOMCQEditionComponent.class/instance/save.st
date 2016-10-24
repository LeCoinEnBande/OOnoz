action
save
	[ self mcq validate.
	self mcq save.
	self answer: true ]
		on: OOInvalidObject
		do: [ self hasBeenValidated: true ]