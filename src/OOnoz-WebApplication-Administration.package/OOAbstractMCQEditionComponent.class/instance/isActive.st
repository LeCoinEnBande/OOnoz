testing
isActive
	^ self questionComponents detect: [ :c | c isActive ] ifFound: [ false ] ifNone: [ true ]