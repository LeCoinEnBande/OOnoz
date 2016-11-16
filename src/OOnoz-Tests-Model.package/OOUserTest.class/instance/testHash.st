tests
testHash
	| instance2 |
	instance2 := self newInstance.
	self assert: user hash equals: user copy hash.
	self assert: user hash equals: instance2 hash