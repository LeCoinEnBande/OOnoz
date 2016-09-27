tests
testTooManyRightAnswers
	answers := self generateAnswersUpTo: 5 rights: 5.
	self
		should: [ strategy validate: answers ]
		raise: OOInvalidQuestion
		description:
			'There is too many right answer for this kind of question. A Multiple choice question should not be able to have all questions right.'