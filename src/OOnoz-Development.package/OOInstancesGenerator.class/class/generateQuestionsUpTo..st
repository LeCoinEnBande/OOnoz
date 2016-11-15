helpers
generateQuestionsUpTo: anInteger
	| res |
	res := Set new.
	1 to: anInteger do: [ :int | 
		| question |
		question := (OOAbstractQuestion allSubclasses reject: #isAbstract) atRandom new.
		question description: self lorem atRandom.
		question index: int.
		(1 to: 2) atRandom even
			ifTrue: [ question correction: self lorem atRandom ].
		self setAnswersOf: question.
		res add: question ].
	^ res