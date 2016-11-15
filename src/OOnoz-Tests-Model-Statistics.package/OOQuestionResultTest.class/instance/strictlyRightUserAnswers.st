helpers
strictlyRightUserAnswers
	^ Dictionary
		with: (OOAnswer text: 'answer1' isRight: true) -> true
		with: (OOAnswer text: 'answer2' isRight: false) -> false