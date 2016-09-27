tests
testTooManyRightAnswers
	answers := self generateAnswersUpTo: 2 rights: 2.
	self
		should: [ strategy validate: answers ]
		raise: OOInvalidQuestion
		description: 'There is too many right answer for this kind of question.'