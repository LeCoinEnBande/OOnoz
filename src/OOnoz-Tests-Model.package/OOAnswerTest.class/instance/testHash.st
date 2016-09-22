tests
testHash
	| instance2 |
	instance2 := self newAnswerInstance.
	self assert: answer hash equals: answer copy hash.
	self assert: answer hash equals: instance2 hash