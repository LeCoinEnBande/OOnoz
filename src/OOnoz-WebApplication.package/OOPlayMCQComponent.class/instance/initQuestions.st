initialization
initQuestions
	self questions: (Array new: self mcq questions size).
	self mcq orderedQuestions
		doWithIndex: [ :q :i | 
			self questions
				at: i
				put:
					(OOPlayQuestionComponent
						owner: self
						result: (self result questionResultFor: q)
						index: i) ].
	self questions first activate