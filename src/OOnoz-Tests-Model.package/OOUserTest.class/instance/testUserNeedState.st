tests
testUserNeedState
	user state: nil.
	self should: [ user validate ] raise: OOInvalidUser 