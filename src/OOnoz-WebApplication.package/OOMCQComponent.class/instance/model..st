accessing
model: aMCQ
	model := aMCQ.
	self questions: (aMCQ randomizedQuestions collect: [ :question | OOQuestionComponent model: question mcq: self ])