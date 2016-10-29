testing
passwordMatch: aString
	^ self password = (self cipher: aString)