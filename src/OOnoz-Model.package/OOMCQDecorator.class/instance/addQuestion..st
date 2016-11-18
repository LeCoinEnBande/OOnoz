adding
addQuestion: aQuestion
	^ self mcq ifNotNil: [ :m | m addQuestion: aQuestion ]