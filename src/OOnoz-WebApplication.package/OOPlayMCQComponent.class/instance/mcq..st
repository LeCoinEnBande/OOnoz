accessing
mcq: aMCQ
	mcq := aMCQ.
	aMCQ orderedQuestions doWithIndex: [ :q :i | self questions add: (OOPlayQuestionComponent question: q index: i) ]