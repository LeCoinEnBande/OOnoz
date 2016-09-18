accessing
model: aQuestion
	model := aQuestion.
	self answers: (aQuestion randomizedAnswers collect: [ :answer | OOAnswerComponent model: answer ])