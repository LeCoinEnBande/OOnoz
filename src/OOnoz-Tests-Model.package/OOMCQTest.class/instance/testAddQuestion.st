tests
testAddQuestion
	| size |
	size := mcq questions size.
	mcq
		addQuestion:
			(OOAbstractQuestion
				description: 'I am another question'
				answers: (Set with: (OOAnswer text: 'I am an answer' isRight: true))).
	self assert: mcq questions size equals: size + 1