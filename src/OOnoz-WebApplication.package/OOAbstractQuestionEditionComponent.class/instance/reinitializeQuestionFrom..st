action
reinitializeQuestionFrom: aClass
	| newQuestion |
	self mcq removeQuestion: self question.
	self mcq addQuestion: (newQuestion := aClass new index: self question index).
	self question: newQuestion.
	aClass minimumNumberOfAnswers timesRepeat: [ self question addEmptyAnswer ]