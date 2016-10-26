tests
testAddToDuration
	self assert: result duration equals: Duration zero.
	result addToDuration: (Duration milliSeconds: 10000).
	self assert: result duration equals: (Duration milliSeconds: 10000).
	result addToDuration: (Duration milliSeconds: 24000).
	self assert: result duration equals: (Duration milliSeconds: 34000)