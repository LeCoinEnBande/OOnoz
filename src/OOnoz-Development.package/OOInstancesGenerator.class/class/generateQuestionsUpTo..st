helpers
generateQuestionsUpTo: anInteger
	| res |
	res := Set new.
	1 to: anInteger do: [ :int | 
		| question |
		question := (OOAbstractQuestion allSubclasses reject: #isAbstract) atRandom new.
		question description: (self randomStringBetween: 10 and: 100).
		question index: int.
		question
			answers:
				(self
					generateAnswersUpTo: (question questionClass minimumNumberOfAnswers to: question questionClass maximumNumberOfAnswers) atRandom
					rights: (question questionClass minNumberOfRightAnswers to: question questionClass maxNumberOfRightAnswers) atRandom).
		(1 to: 2) atRandom even
			ifTrue: [ question correction: (self randomStringBetween: 10 and: 100) ].
		res add: question ].
	^ res