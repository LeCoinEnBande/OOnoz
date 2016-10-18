tests
testInvalidateQuestionWithTooManyAnswers
	question answers: (self generateAnswersUpTo: self actualClass maximumNumberOfAnswers + 1 rights: 0).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a maximum number of answers to be valide.'