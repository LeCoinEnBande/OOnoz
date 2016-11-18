removing
removeQuestion: aQuestion
	^ self mcq ifNotNil: [ :m | m removeQuestion: aQuestion ]