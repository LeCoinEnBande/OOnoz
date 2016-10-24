comparing
= anObject
	^ self species = anObject species and: [ self text = anObject text and: [ self isRight = anObject isRight and: [ self index = anObject index ] ] ]