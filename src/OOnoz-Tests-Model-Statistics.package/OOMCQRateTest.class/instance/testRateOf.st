tests
testRateOf
	(OOMCQRate stub selectMany: Any)
		willReturn:
			{(OOMCQRate rate: 5).
			(OOMCQRate rate: 0)}.
	self assert: (OOMCQRate rateOf: Any) equals: 2.5.
	OOMCQRate recoverFromGHMutation