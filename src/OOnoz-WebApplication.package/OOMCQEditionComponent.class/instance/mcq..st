accessing
mcq: anObject
	super mcq: anObject.
	self memento: mcq createMemento.
	self questionComponents: (mcq questions collect: [ :q | OOQuestionEditionComponent owner: self question: q ])