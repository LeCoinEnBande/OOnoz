validation
validate
	self flag: #todo.
	"self answers size >= self class minimumNumberOfAnswers
		ifFalse: [ self invalidate: 'Not enough answers to be valid.' ].
	self answers size <= self class maximumNumberOfAnswers
		ifFalse: [ self invalidate: 'Too much answers to be valid.' ].
	(self description isNotNil and: [ self description isString ])
		ifFalse: [ self invalidate: 'The description need to be set and need to be a string.' ]"