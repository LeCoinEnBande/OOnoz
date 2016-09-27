tests
testInvalidateQuestionWithTooManyAnswers
	answers := (self generateAnswersUpTo: OOQuestion maximumNumberOfAnswers + 1 rights: 0).
	self
		should: [ strategy validate: answers ]
		raise: OOInvalidQuestion
		description: 'A Question should have a maximum number of answers to be valide.'