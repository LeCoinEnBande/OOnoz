tests
testCorrection
	self deny: question hasCorrection.
	question explanation: (OOExplanation explanation: 'explication').
	self assert: question hasCorrection.
	self assert: question correction equals: 'explication'