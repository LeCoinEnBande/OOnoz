initialization
initQuestions
	self questions: (Array new: self mcqResult questionResults size).
	self mcqResult questionResults
		doWithIndex:
			[ :q :i | self questions at: i put: (OOQuestionResultComponent result: q index: i) ]