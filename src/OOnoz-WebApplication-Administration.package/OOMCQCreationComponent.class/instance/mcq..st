accessing
mcq: anObject
	super mcq: anObject.
	self questionComponents: OrderedCollection new.
	1 to: OOMCQ minimumNumberOfQuestions do: [ :i | self creationNewQuestionAt: i ].