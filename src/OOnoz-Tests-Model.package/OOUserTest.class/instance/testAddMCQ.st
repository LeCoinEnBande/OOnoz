tests
testAddMCQ
	| size |
	size := user mcqs size.
	user addMCQ: Mock new.
	self assert: user mcqs size equals: size + 1