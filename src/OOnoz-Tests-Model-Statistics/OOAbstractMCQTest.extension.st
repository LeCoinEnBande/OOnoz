Extension { #name : #OOAbstractMCQTest }

{ #category : #'*OOnoz-Tests-Model-Statistics' }
OOAbstractMCQTest >> testAverageRate [
	(OOMCQRate stub selectMany: Any)
		willReturn:
			{(OOMCQRate rate: 5).
			(OOMCQRate rate: 0)}.
	self assert: mcq averageRate equals: 2.5.
	OOMCQRate recoverFromGHMutation
]
