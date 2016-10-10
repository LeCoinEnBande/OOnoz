tests
testHash
	| instance2 |
	instance2 := self newQuestionInstance.
	self assert: question hash equals: question copy hash.
	self assert: question hash equals: instance2 hash