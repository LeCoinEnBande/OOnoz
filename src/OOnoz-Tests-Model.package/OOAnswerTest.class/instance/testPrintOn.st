tests
testPrintOn
	answer isRight: true.
	answer index: 1.
	self assert: ((String streamContents: [ :s | answer printOn: s ]) includesSubstring: '(true-1)')