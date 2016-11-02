accessing
mcq: aMCQ
	self result: (OOMCQResult user: self currentUser mcq: aMCQ).
	aMCQ orderedQuestions doWithIndex: [ :q :i | self questions add: (OOPlayQuestionComponent result: (self result questionResultFor: q) index: i) ]