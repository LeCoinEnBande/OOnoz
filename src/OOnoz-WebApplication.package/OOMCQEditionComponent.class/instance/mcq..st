accessing
mcq: anObject
	super mcq: anObject.
	self momento: mcq createMomento.
	self questionComponents: (mcq questions collect: [ :q | OOQuestionEditionComponent owner: self question: q ])