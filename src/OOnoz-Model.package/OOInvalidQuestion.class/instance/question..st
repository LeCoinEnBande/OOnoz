accessing
question: aQuestion
	question := aQuestion.
	self messageText: self question asString , ' is an invalid question.'