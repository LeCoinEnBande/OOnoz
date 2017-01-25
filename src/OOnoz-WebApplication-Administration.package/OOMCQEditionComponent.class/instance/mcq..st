accessing
mcq: anObject
	super mcq: anObject.
	self memento: mcq createMemento.
	self
		questionComponents:
			((mcq questions collect: [ :q | OOQuestionEditionComponent owner: self question: q ])
				asArray sort: [ :q1 :q2 | q1 question index < q2 question index ])