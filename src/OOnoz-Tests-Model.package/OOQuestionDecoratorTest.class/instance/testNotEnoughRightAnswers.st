tests
testNotEnoughRightAnswers
	question answers: (self generateAnswersUpTo: self decoratedClass minimumNumberOfAnswers rights: self minNumberOfRightAnswers - 1).
	self
		should: [ question validate ]
		raise: OOInvalidQuestion
		description: 'There is not enough right answer for this kind of question.'