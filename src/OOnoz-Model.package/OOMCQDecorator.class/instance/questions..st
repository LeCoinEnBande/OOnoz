accessing
questions: aCollection
	^ self mcq ifNotNil: [ :m | m questions: aCollection ]