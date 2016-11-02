accessing
mcq: aMCQ
	self result: (OOMCQResult user: self currentUser mcq: aMCQ).
	self initQuestions.
	self result save