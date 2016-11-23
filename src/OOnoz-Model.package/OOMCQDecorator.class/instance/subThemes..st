accessing
subThemes: aCollection
	^ self mcq ifNotNil: [ :m | m subThemes: aCollection ]