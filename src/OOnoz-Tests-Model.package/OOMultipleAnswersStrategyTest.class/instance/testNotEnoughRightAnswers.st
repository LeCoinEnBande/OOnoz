tests
testNotEnoughRightAnswers
	answers := self generateAnswersUpTo: 5 rights: 0.
	self
		should: [ strategy validate: answers ]
		raise: OOInvalidQuestion
		description:
			'There is not enough right answer for this kind of question. A Multiple choice question should not be able to have zero question right.'