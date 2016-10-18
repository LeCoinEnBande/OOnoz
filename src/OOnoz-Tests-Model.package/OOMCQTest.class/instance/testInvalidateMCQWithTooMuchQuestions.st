tests
testInvalidateMCQWithTooMuchQuestions
	mcq questions: (self generate: OOMCQ maximumNumberOfQuestions + 1 questionValid: true).
	self
		should: [ mcq validate ]
		raise: OOInvalidMCQ
		description: 'A MCQ should have a maximum number of questions to be valide.'