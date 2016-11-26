tests
testCannotGetTwoTimesTheSameQuestion
	| size question |
	size := mcq questions size.
	question := OOAbstractQuestion description: 'I am another question' answers: (Set with: (OOAnswer text: 'I am an answer' isRight: true)).
	mcq addQuestion: question.
	self assert: mcq questions size equals: size + 1.
	mcq addQuestion: question.
	self assert: mcq questions size equals: size + 1