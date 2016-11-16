tests
testUserNeedAddress
	user address: nil.
	self should: [ user validate ] raise: OOInvalidUser 