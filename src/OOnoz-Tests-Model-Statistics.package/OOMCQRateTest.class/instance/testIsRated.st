tests
testIsRated
	| rate |
	rate := OOMCQRate rate: 4.
	self assert: rate isRated.
	rate rate: nil.
	self deny: rate isRated