tests
testInvalidateQuestionWithBadDescription
	question description: nil.
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a description to be valide.'