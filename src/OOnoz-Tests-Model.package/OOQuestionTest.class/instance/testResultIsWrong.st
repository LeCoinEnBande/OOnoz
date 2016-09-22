tests
testResultIsWrong
	| input |
	question := self newComplexQuestionInstance.
	input := Dictionary new.
	question answers do: [ :answer | input at: answer put: answer isRight not ].
	self assert: (question resultFrom: input) = 0 description: 'All the answers are false so it should be 0.'