tests
testPasswordMatch
	| password |
	password := 'ATestPassword092«'.
	user password: password.
	self assert: (user passwordMatch: password)