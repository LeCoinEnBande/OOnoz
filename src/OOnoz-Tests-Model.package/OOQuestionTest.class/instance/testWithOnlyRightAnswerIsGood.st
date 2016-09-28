tests
testWithOnlyRightAnswerIsGood
	question answers: (self generateAnswersUpTo: OOQuestion minimumNumberOfAnswers).
	question answers do: [ :answer | answer isRight: true ].
	self
		shouldnt: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should be valide with only right answers.'