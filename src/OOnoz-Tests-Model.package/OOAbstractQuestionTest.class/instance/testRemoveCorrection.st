tests
testRemoveCorrection
	question correction: 'correction'.
	self assert: question hasCorrection.
	question removeCorrection.
	self deny: question hasCorrection