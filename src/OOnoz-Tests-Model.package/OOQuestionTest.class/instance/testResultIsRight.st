tests
testResultIsRight
	| input |
	question := self newComplexQuestionInstance.
	input := Dictionary new.
	question answers do: [ :answer | input at: answer put: answer isRight ].
	self assert: (question resultFrom: input) = 1 description: 'All the answers are right so it should be 1.'