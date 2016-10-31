tests
testUserNeedLastName
	user directPassword: nil.
	self should: [ user validate ] raise: OOInvalidUser 