tests
testCheckDisponibility
	[ (OOTheme stub selectOne: Any) willReturn: self newInstance.
	self should: [ instance checkDisponibility ] raise: OOUnavailableObject ]
		ensure: [ OOTheme recoverFromGHMutation ]