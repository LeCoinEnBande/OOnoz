tests
testInvalidateQuestionWithBadDescription
	question answers: (self generateAnswersUpTo: self validAssociation key rights: self validAssociation value).
	question description: nil.
	self should: [ question validate ] raise: OOInvalidQuestion description: 'A Question should have a description to be valide.'