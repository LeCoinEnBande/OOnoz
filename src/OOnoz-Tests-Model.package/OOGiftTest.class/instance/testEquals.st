tests
testEquals
	| instance2 |
	instance2 := self newInstance.
	self assert: gift = instance2 description: 'The two intances should be equal.'.
	self assert: gift copy = gift description: 'The two instances should be equal'.
	instance2 description: 'Foo'.
	self deny: gift = instance2