tests
testNotEnoughRightAnswers
	answers := self generateAnswersUpTo: 2 rights: 0.
	self
		should: [ strategy validate: answers ]
		raise: OOInvalidQuestion
		description: 'There is not enough right answer for this kind of question.'