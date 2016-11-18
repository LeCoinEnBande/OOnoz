tests
testInvalidateMCQWithoutMarkingScheme
	mcq questions: (self generate: self actualClass minimumNumberOfQuestions questionValid: true).
	mcq markingScheme: nil.
	self should: [ mcq validate ] raise: OOInvalidMCQ description: 'The MCQ should have a marking scheme to be valid.'