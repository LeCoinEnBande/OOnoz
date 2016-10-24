tests
testValidation
	mcq questions: (self generate: OOMCQ minimumNumberOfQuestions - 1 questionValid: true).
	self
		should: [ mcq validate ]
		raise: OOInvalidMCQ
		description: 'A MCQ should have a minimum number of questions to be valide.'.
	mcq questions: (self generate: OOMCQ maximumNumberOfQuestions + 1 questionValid: true).
	self
		should: [ mcq validate ]
		raise: OOInvalidMCQ
		description: 'A MCQ should have a maximum number of questions to be valide.'.
	mcq questions: (self generate: OOMCQ minimumNumberOfQuestions questionValid: true).
	self shouldnt: [ mcq validate ] raise: OOInvalidMCQ description: 'The question should be valid.'.
	mcq questions: (self generate: OOMCQ minimumNumberOfQuestions questionValid: false).
	self
		should: [ mcq validate ]
		raise: OOInvalidQuestion
		description: 'A MCQ should not be valid if the questions are not valid.'