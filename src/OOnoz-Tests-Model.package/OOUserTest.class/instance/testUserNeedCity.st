tests
testUserNeedCity
	user city: nil.
	self should: [ user validate ] raise: OOInvalidUser 