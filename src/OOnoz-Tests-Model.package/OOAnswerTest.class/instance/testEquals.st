tests
testEquals
	| instance2 |
	instance2 := self newAnswerInstance.
	self assert: answer = instance2 description: 'The two intances should be equal.'.
	self assert: answer copy = answer description: 'The two instances should be equal'.
	instance2 isRight: false.
	self
		deny: answer = instance2
		description: 'The two intances should not be equal because one is right and the other wrong.'