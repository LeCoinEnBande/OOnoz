tests
testInvalidateMCQWithoutTitle
	mcq questions: (self generate: OOMCQ minimumNumberOfQuestions questionValid: true).
	mcq title: nil.
	self should: [ mcq validate ] raise: OOInvalidMCQ description: 'The question should have a title to be valid.'