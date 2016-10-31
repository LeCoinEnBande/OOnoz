tests
testUserNeedPassword
	user directPassword: nil.
	self should: [ user validate ] raise: OOInvalidUser 