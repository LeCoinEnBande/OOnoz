tests
testValidate
	question answers: (self generateAnswersUpTo: OOQuestion minimumNumberOfAnswers - 1).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a minimum number of answers to be valide.'.
	question answers: (self generateAnswersUpTo: OOQuestion maximumNumberOfAnswers + 1).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a maximum number of answers to be valide.'.
	question answers: (self generateAnswersUpTo: OOQuestion minimumNumberOfAnswers).
	self
		shouldnt: [ question validate ]
		raise: OOInvalidQuestion
		description: 'The question should be valid.'.
	question description: nil.
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a description to be valide.'