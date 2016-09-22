helpers
newComplexQuestionInstance
	^ OOQuestion
		description: 'I am a question'
		answers:
			(Set
				with: (OOAnswer text: 'foo' isRight: true)
				with: (OOAnswer text: 'bar' isRight: true)
				with: (OOAnswer text: 'toto' isRight: false)
				with: (OOAnswer text: 'tata' isRight: false)
				with: (OOAnswer text: 'titi' isRight: false))