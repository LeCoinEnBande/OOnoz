helpers
generateAnswersUpTo: anInteger
	^ (1 to: anInteger)
		inject: Set new
		into: [ :coll :each | 
			coll add: (OOAnswer text: each asString isRight: true).
			coll ]