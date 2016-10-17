tests
testPrintOn
	answer isRight: true.
	self assert: ((String streamContents: [ :s | answer printOn: s ]) includesSubstring: '(true)')