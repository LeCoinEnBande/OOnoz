helpers
newQuestionInstance
	^ OOQuestion
		description: 'I am a question'
		answers: (Set with: OOAnswerTest new newAnswerInstance)