accessing
randomizedQuestions
	^ self questions sorted: [ :a :b | (1 to: 2) atRandom even ]