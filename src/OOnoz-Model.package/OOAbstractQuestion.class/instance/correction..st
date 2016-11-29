accessing
correction: aString
	aString isEmptyOrNil
		ifFalse: [ self explanation: (OOExplanation explanation: aString) ]