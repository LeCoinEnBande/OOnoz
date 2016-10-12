validate
validate
	[ self questions do: [ :each | each validate ] ]
		on: OOInvalidQuestion
		do: [ :e | (OOInvalidMCQ mcq: self) signal ].
	(self questions size >= self class minimumNumberOfQuestions
		and: [ self questions size <= self class maximumNumberOfQuestions ])
		ifFalse: [ (OOInvalidMCQ mcq: self) signal ]