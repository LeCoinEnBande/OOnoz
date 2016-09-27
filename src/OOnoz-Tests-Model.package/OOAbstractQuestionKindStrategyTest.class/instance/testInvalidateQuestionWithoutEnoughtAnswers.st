tests
testInvalidateQuestionWithoutEnoughtAnswers
	answers := (self generateAnswersUpTo: OOQuestion minimumNumberOfAnswers - 1 rights: 0).
	self
		should: [ strategy validate: answers ]
		raise: OOInvalidQuestion
		description: 'A Question should have a minimum number of answers to be valide.'