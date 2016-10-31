tests
testPasswordShouldNeedMail
	user directMail: nil.
	self should: [ user password: 'ATestPasswordToTry3210/' ] raise: OOError