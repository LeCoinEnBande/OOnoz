tests
testAllChecked
	| answerMap |
	answerMap := Dictionary new.
	self answers
		do: [ :answer | answerMap at: answer put: true ].
	self
		assert: (self actualClass computeResultFrom: answerMap)
		equals: self allCheckedResult