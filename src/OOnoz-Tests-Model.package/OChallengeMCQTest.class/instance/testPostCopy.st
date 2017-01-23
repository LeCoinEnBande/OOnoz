tests
testPostCopy
	| aGift |
	mcq gift: (aGift := OOGift description: 'blabla').
	mcq postCopy.
	self assert: mcq gift equals: aGift.
	self deny: mcq gift == aGift