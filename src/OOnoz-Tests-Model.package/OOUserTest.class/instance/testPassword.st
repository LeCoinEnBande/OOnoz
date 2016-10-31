tests
testPassword
	| password |
	password := 'ATestPassword092«'.
	user password: password.
	self deny: user password = password