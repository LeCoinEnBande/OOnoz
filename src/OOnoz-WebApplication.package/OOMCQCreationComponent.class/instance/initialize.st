initialization
initialize
	super initialize.
	self mcq: OOMCQ new.
	self questionComponents: OrderedCollection new.
	1 to: OOMCQ minimumNumberOfQuestions do: [ :i | 
		| question |
		question := OOAbstractQuestion new index: i.
		self mcq addQuestion: question.
		self questionComponents add: (OOQuestionCreationComponent owner: self question: question) ].
	self hasBeenValidated: false