tests
testResultMissmatch
	| input |
	question := self newComplexQuestionInstance.
	input := Dictionary new.
	question answers asArray allButLast do: [ :answer | input at: answer put: answer isRight ].
	self should: [ question resultFrom: input ] raise: SizeMismatch description: 'The answers size is not correct. It should raise an error.'