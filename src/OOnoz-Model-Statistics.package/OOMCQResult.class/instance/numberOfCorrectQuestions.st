accessing
numberOfCorrectQuestions
	^ (self questionResults select: #isCorrect) size