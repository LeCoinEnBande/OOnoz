tests
testEquals
	| instance2 |
	instance2 := self newMCQInstance.
	self assert: mcq = instance2 description: 'The two intances should be equal.'.
	self assert: mcq copy = mcq description: 'The two instances should be equal'.
	instance2 title: 'Another title'.
	self deny: mcq = instance2 description: 'The two intances should not be equal because the second one has one more answer.'