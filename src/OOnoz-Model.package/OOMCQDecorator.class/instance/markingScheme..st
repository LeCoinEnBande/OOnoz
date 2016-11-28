accessing
markingScheme: aClass
	^ self mcq ifNotNil: [ :m | m markingScheme: aClass ]