tests
testEquals
	| instance2 |
	instance2 := self newInstance.
	self assert: result = instance2 description: 'The two intances should be equal.'.
	self assert: result copy = result description: 'The two instances should be equal'.
	instance2 user: OONilUser new.
	self deny: result = instance2 description: 'The two intances should not be equal.'.