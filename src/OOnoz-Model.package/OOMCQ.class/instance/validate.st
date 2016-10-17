validate
validate
	[ self questions do: [ :each | each validate ] ]
		on: OOInvalidQuestion
		do: [ :e | self invalidate ].
	(self questions size
		between: self class minimumNumberOfQuestions
		and: self class maximumNumberOfQuestions)
		ifFalse: [ self invalidate ].
	self title ifNil: [ self invalidate ].
	self markingScheme ifNil: [ self invalidate ]