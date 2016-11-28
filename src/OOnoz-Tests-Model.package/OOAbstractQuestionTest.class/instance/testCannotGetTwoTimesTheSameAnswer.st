tests
testCannotGetTwoTimesTheSameAnswer
	| size answer |
	size := question answers size.
	answer := OOAnswer text: 'toto' isRight: true.
	question addAnswer: answer.
	self assert: question answers size equals: size + 1.
	question addAnswer: answer.
	self assert: question answers size equals: size + 1