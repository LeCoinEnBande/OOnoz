tests
testCheckDisponibility
	SystemVersion current major = 4 ifTrue: [ self skip ].
	[ (user class stub selectOne: Any) willReturn: user.
	self should: [ user checkDisponibility ] raise: OOUnavailableUser.
	(user class stub selectOne: Any) willReturn: nil.
	self shouldnt: [ user checkDisponibility ] raise: OOUnavailableUser ]
		ensure: [ user class recoverFromGHMutation ]