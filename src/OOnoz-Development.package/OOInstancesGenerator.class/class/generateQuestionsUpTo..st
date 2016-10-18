helpers
generateQuestionsUpTo: anInteger
	| res |
	res := Set new.
	1 to: anInteger do: [ :int | 
		| question |
		question := (OOAbstractQuestion allSubclasses reject: #isAbstract) atRandom new.
		question description: (self randomStringBetween: 10 and: 100).
		question
			answers:
				(self
					generateAnswersUpTo: (question class minimumNumberOfAnswers to: question class maximumNumberOfAnswers) atRandom
					rights: (question class minNumberOfRightAnswers to: question class maxNumberOfRightAnswers) atRandom).
		(1 to: 2) atRandom even
			ifTrue: [ question correction: (self randomStringBetween: 10 and: 100) ].
		res add: question ].
	^ res