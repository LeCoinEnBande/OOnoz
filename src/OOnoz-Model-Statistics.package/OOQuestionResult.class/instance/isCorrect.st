testing
isCorrect
	self userAnswers
		keysAndValuesDo: [ :k :v | 
			k isRight = v
				ifFalse: [ ^ false ] ].
	^ true