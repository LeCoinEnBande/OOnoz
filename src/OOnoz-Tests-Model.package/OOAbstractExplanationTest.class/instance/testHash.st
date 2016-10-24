tests
testHash
	| instance2 |
	instance2 := self newInstance.
	self assert: explanation hash equals: explanation copy hash.
	self assert: explanation hash equals: instance2 hash