tests
testValidAnswers
	answers := self generateAnswersUpTo: self validAssociation key rights: self validAssociation value.
	self shouldnt: [ strategy validate: answers ] raise: OOInvalidQuestion