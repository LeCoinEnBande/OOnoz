tests
testResult
	result questionResults: (self generateQuestionsResultWithResults: self resultReturning5).
	self assert: result result equals: 5