helpers
newQuestionInstance
	^ self actualClass decoratedQuestion: (self decoratedClass description: 'I am a description' answers: Set new)