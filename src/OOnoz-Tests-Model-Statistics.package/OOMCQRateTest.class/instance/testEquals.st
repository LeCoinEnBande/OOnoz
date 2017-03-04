tests
testEquals
	| instance instance2 |
	instance := self newInstance.
	instance2 := self newInstance.
	self assert: instance = instance2 description: 'The two intances should be equal.'.
	self assert: instance copy = instance description: 'The two instances should be equal'.
	instance2 rate: 1.
	self deny: instance = instance2 description: 'The two intances should not be equal because the second is different.'