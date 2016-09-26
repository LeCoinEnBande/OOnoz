tests
testAllRightAnswers
	| answerMap |
	answerMap := Dictionary new.
	self answers
		do: [ :answer | answerMap at: answer put: answer isRight ].
	self
		assert: (self actualClass computeResultFrom: answerMap)
		equals: self allRightResult