tests
testAddAnswer
	| size |
	size := question answers size.
	question addAnswer: (OOAnswer text: 'toto' isRight: true).
	self assert: question answers size equals: size + 1