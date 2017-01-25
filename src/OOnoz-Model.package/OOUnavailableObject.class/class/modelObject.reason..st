instance creation
modelObject: anObject reason: aString
	^ self new
		reason: aString;
		object: anObject;
		yourself