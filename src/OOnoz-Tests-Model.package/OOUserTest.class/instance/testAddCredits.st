tests
testAddCredits
	user credits: 20.
	self assert: user credits equals: 20.
	user addCredits: 35.
	self assert: user credits equals: 55