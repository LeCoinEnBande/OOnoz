tests
testCannotChangePassword
	self should: [ user mail: 'other@gmail.com' ] raise: OOError