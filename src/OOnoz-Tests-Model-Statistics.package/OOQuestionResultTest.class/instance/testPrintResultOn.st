tests
testPrintResultOn
	result userAnswers: self strictlyRightUserAnswers.
	result stub markingScheme willReturn: OOStrictScheme.
	self assert: (String streamContents: [ :s | result printResultOn: s ]) equals: '1/1'