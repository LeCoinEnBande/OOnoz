tests
testRemoveQuestion
	| aQuestion sizeBeforeRemoval |
	aQuestion := OOBinaryQuestion
		description: 'test'
		answers: [ 'a1' add: 'a2' ].
	mcq addQuestion: aQuestion.
	sizeBeforeRemoval := mcq questions size.
	mcq removeQuestion: aQuestion.
	self assert: mcq questions size equals: sizeBeforeRemoval - 1