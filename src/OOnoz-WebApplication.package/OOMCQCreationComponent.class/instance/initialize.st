initialization
initialize
	super initialize.
	self mcq: OOMCQ new.
	1 to: OOMCQ minimumNumberOfQuestions do: [ :i | self mcq addQuestion: (OOAbstractQuestion new index: i) ].
	self hasBeenValidated: false