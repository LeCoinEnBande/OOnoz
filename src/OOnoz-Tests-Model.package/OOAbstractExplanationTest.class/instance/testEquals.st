tests
testEquals
	| instance2 |
	instance2 := self newInstance.
	self assert: explanation = instance2 description: 'The two intances should be equal.'.
	self assert: explanation copy = explanation description: 'The two instances should be equal'