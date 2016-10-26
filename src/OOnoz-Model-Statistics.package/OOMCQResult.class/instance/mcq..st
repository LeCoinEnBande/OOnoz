accessing
mcq: aMCQ
	mcq := aMCQ.
	self questionResults addAll: (aMCQ questions collect: [ :question | OOQuestionResult question: question ])