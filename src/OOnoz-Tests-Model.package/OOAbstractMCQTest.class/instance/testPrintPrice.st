tests
testPrintPrice
	| mcqTest |
	mcqTest := self newMCQInstance price: 15.
	self assert: mcqTest printPrice equals: '15C'