tests
testAllFalseAnswers
	| answerMap |
	answerMap := Dictionary new.
	self answers do: [ :answer | answerMap at: answer put: answer isRight not ].
	self assert: (self actualClass computeResultFrom: answerMap) equals: self allWrongResult