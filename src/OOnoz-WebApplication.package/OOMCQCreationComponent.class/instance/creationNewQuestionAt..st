initialization
creationNewQuestionAt: i
	| question |
	question := OOAbstractQuestion new index: i.
	self mcq addQuestion: question.
	self questionComponents add: (OOQuestionCreationComponent owner: self question: question)