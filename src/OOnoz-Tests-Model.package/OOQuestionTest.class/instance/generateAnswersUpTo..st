helpers
generateAnswersUpTo: anInteger
	^ (1 to: anInteger)
		inject: Set new
		into: [ :coll :each | 
			coll add: (OOAnswer text: each asString isRight: (1 to: 2) atRandom even).
			coll ]