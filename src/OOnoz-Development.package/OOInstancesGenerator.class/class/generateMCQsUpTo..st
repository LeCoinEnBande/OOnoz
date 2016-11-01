helpers
generateMCQsUpTo: anInteger
	| res |
	res := OrderedCollection new.
	1 to: anInteger do: [ :int | 
		| mcq |
		mcq := OOMCQ new.
		mcq title: (self randomStringBetween: 10 and: 100).
		mcq questions: (self generateQuestionsUpTo: (OOMCQ minimumNumberOfQuestions to: OOMCQ maximumNumberOfQuestions) atRandom).
		mcq markingScheme: (OOAbstractMarkingSchemeStrategy allSubclasses reject: #isAbstract) atRandom.
		mcq orderer: (OOAbstractOrder allSubclasses reject: #isAbstract) atRandom.
		res add: mcq ].
	^ res