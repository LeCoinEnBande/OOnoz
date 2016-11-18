tests
testInvalidateMCQWithInvalidQuestions
	mcq questions: (self generate: self actualClass minimumNumberOfQuestions questionValid: false).
	self
		should: [ mcq validate ]
		raise: OOInvalidQuestion
		description: 'A MCQ should not be valid if the questions are not valid.'