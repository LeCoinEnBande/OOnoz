as yet unclassified
sortedQuestions
	^ self questions asArray sort: [ :a :b | a index < b index ]