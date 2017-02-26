tests
testIsFree
	mcq price: 30.
	self deny: mcq isFree.
	mcq price: 0.
	self assert: mcq isFree