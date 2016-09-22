testing
isValidated
	^ self questions detect: [ :question | question isValidated not ] ifFound: [ false ] ifNone: [ true ]