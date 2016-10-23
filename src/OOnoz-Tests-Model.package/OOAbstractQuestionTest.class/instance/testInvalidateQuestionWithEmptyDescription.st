tests
testInvalidateQuestionWithEmptyDescription
	question answers: (self generateAnswersUpTo: self validAssociation key rights: self validAssociation value).
	question description: ''.
	self should: [ question validate ] raise: OOInvalidQuestion description: 'A Question should have a description to be valide.'