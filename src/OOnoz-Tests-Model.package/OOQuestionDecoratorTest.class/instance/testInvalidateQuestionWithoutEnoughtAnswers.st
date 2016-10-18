as yet unclassified
testInvalidateQuestionWithoutEnoughtAnswers
	question answers: (self generateAnswersUpTo: self decoratedClass minimumNumberOfAnswers - 1 rights: 0).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should have a minimum number of answers to be valide.'