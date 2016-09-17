tests
testInvalidateQuestionWithTooManyAnswers
	question answers: (self generateAnswersUpTo: OOQuestion maximumNumberOfAnswers + 1).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a maximum number of answers to be valide.'