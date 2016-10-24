tests
testTooManyRightAnswers
	question answers: (self generateAnswersUpTo: self decoratedClass maximumNumberOfAnswers rights: self maxNumberOfRightAnswers + 1).
	self should: [ question validate ] raise: OOInvalidQuestion description: 'There is too many right answer for this kind of question.'