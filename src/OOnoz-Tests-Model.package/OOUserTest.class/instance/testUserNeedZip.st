tests
testUserNeedZip
	user zip: nil.
	self should: [ user validate ] raise: OOInvalidUser 