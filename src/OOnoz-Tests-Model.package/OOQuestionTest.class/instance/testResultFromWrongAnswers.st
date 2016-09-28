tests
testResultFromWrongAnswers
	| input |
	question := self newComplexQuestionInstance.
	input := Dictionary new.
	question answers asArray allButLast do: [ :answer | input at: answer put: answer isRight ].
	input at: (OOAnswer text: 'This is not the right answer' isRight: true ) put: true.
	self should: [ question resultFrom: input ] raise: OOAnswerDoesNotMatch description: 'One answer is not from the question. It should raise an error.'