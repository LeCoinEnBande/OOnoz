accessing
randomizedAnswers
	^ self answers sorted: [ :a :b | (1 to: 2) atRandom even ]