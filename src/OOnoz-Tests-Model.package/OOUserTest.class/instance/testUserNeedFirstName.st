tests
testUserNeedFirstName
	user firstName: nil.
	self should: [ user validate ] raise: OOInvalidUser 