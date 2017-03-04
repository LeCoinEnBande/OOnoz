tests
testRemainingGifts
	gift number: 100.
	gift stub winners willReturn: (Array new: 23).
	self assert: gift remainingGifts equals: 77