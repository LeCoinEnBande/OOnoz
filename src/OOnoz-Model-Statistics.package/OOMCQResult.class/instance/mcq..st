accessing
mcq: aMCQ
	mcq := aMCQ.
	self questionResults addAll: (aMCQ questions collect: [ :question | OOQuestionResult owner: self question: question ])