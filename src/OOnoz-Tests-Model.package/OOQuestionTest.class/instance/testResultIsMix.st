tests
testResultIsMix
	| input |
	question := self newComplexQuestionInstance.
	input := Dictionary new.
	question answers do: [ :answer | input at: answer put: answer isRight ].
	input at: (OOAnswer text: 'foo' isRight: true) put: false.
	self
		assert: (question resultFrom: input) = (4 / 5)
		description: 'One answer out of 5 is wrong. The result should be 0.8.'