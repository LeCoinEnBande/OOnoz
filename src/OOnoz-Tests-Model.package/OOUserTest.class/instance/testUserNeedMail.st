tests
testUserNeedMail
	user directMail: nil.
	self should: [ user validate ] raise: OOInvalidUser 