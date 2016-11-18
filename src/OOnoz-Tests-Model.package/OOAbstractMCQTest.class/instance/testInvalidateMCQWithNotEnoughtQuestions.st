tests
testInvalidateMCQWithNotEnoughtQuestions
	mcq questions: (self generate: self actualClass minimumNumberOfQuestions - 1 questionValid: true).
	self
		should: [ mcq validate ]
		raise: OOInvalidMCQ
		description: 'A MCQ should have a minimum number of questions to be valide.'