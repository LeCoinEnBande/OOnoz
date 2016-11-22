tests
testHasGift
	mcq giftDescription: 'A gift'.
	self assert: mcq hasGift.
	mcq resetGift.
	self deny: mcq hasGift