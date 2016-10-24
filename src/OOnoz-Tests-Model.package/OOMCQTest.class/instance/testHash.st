tests
testHash
	| instance2 |
	instance2 := self newMCQInstance.
	self assert: mcq hash equals: mcq copy hash.
	self assert: mcq hash equals: instance2 hash