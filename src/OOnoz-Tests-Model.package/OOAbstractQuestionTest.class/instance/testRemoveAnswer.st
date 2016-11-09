tests
testRemoveAnswer
	question answers: #('a1' 'a2') asSet.
	self assert: question answers size equals: 2.
	question removeAnswer: 'a1'.
	self assert: question answers size equals: 1