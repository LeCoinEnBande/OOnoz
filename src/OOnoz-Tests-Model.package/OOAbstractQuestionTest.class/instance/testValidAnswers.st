tests
testValidAnswers
	question answers: (self generateAnswersUpTo: self validAssociation key rights: self validAssociation value).
	self shouldnt: [ question validate ] raise: OOInvalidQuestion