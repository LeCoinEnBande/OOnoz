tests
testEquals
	| instance2 |
	instance2 := self newInstance.
	self assert: user = instance2 description: 'The two intances should be equal.'.
	self assert: user copy = user description: 'The two instances should be equal'.
	instance2 directMail: 'otherMail@gmail.com'.
	self deny: user = instance2 description: 'The two intances should not be equal because the second one has not the same mail.'