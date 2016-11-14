tests
testNumberOfCorrectQuestions
	result
		questionResults:
			(self
				generateQuestionsResultWithCorrect: #(false false true true false false true false true false false false true true true false false false true true)).
	self assert: result numberOfCorrectQuestions equals: 9