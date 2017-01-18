accessing
sortedQuestions
	^ self questions ifNotNil: [ :qs | qs asArray sort: [ :a :b | a index < b index ] ]