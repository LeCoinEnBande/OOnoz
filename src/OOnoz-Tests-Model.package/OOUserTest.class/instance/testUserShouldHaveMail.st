tests
testUserShouldHaveMail
	| user |
	user := OOUser new.
	self should: [ user mail ] raise: OOError.
	user mail: 'foo.bar@gmail.com'.
	self shouldnt: [ user mail ] raise: OOError