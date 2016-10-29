action
save
	[ self user validate.
	self user save.
	self flag: #todo
	"self answer: true" ]
		on: OOInvalidUser
		do: [ :err | self hasBeenValidated: true ]