accessing
sortedAnswers
	^ self answers asArray sort: [ :a :b | a index < b index ]