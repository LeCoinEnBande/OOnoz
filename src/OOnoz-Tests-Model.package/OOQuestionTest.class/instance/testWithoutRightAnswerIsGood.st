tests
testWithoutRightAnswerIsGood
	question answers: (self generateAnswersUpTo: OOQuestion minimumNumberOfAnswers).
	question answers do: [ :answer | answer isRight: false ].
	self
		shouldnt: [ question validate ]
		raise: OOInvalidQuestion
		description: 'A Question should not need right answer to be valide.'