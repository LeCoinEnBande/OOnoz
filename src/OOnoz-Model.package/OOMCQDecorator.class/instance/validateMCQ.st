validation
validateMCQ
	^ self mcq ifNotNil: [ :m | m validateMCQ ]