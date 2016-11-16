actions
save
	[ self user validate.
	self user save.
	self answer: true ]
		on: OOInvalidObject
		do: [ :err | self hasBeenValidated: true ]