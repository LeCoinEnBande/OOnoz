tests
testInvalidateQuestionWithNotEnoughAnswers
	question answers: (self generateAnswersUpTo: OOQuestion minimumNumberOfAnswers - 1).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a minimum number of answers to be valide.'