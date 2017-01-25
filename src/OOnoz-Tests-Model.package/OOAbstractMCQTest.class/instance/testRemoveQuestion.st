tests
testRemoveQuestion
	| aQuestion sizeBeforeRemoval |
	aQuestion := OOBinaryQuestion description: 'test' answers: (Set with: (OOAnswer text: 'test' isRight: true)).
	mcq addQuestion: aQuestion.
	sizeBeforeRemoval := mcq questions size.
	mcq removeQuestion: aQuestion.
	self assert: mcq questions size equals: sizeBeforeRemoval - 1