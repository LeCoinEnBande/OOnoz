tests
testCheckDisponibility
	SystemVersion current major = 4 ifTrue: [ self skip ].
	[ (user class stub selectOne: Any) willReturn: user.
	self should: [ user checkDisponibility ] raise: OOIndisponibleUser.
	(user class stub selectOne: Any) willReturn: nil.
	self shouldnt: [ user checkDisponibility ] raise: OOIndisponibleUser ]
		ensure: [ user class recoverFromGHMutation ]