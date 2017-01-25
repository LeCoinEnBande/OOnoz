accessing
roleFrom: aString
	^ self allSubclasses detect: [ :class | class mongoDescription = aString ]