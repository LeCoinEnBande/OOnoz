helpers
generateAnswersUpTo: anInteger rights: anotherInteger
	| remainingRights res |
	remainingRights := anotherInteger.
	res := Set new.
	1 to: anInteger do: [ :int | 
		| answer |
		answer := OOAnswer new.
		answer index: int.
		answer text: (self randomStringBetween: 10 and: 200).
		remainingRights = 0
			ifFalse: [ remainingRights := remainingRights - 1.
				answer isRight: true ].
		res add: answer ].
	^ res