tests
testHasCorrection
	self deny: question hasCorrection.
	question correction: 'explication'.
	self assert: question hasCorrection