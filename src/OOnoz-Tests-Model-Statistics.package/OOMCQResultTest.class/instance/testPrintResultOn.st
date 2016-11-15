tests
testPrintResultOn
	result questionResults: (self generateQuestionsResultWithResults: self resultReturning5).
	self assert: (String streamContents: [ :s | result printResultOn: s ]) equals: '5/20'