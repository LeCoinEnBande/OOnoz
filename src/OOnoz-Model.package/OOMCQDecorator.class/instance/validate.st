validation
validate
	^ self mcq ifNotNil: [ :m | m validate ]