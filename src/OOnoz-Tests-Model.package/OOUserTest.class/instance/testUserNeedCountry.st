tests
testUserNeedCountry
	user country: nil.
	self should: [ user validate ] raise: OOInvalidUser 