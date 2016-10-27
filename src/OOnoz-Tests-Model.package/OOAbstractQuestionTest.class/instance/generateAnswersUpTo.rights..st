helpers
generateAnswersUpTo: anInteger rights: aSecondInteger
	| numbersOfRightAnswersLeft |
	numbersOfRightAnswersLeft := aSecondInteger.
	^ (1 to: anInteger)
		inject: Set new
		into: [ :coll :ind | 
			| mock |
			mock := Mock named: 'Answer' , ind asString.
			mock stub index willReturn: ind.
			numbersOfRightAnswersLeft > 0
				ifTrue: [ numbersOfRightAnswersLeft := numbersOfRightAnswersLeft - 1.
					mock stub isRight willReturn: true ]
				ifFalse: [ mock stub isRight willReturn: false ].
			coll add: mock.
			coll ]