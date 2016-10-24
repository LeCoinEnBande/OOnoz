tests
testInvalidateMCQWithEmptyTitle
	mcq questions: (self generate: OOMCQ minimumNumberOfQuestions questionValid: true).
	mcq title: ''.
	self should: [ mcq validate ] raise: OOInvalidMCQ description: 'The MCQ should have a title non empty to be valid.'