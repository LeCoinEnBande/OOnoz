comparing
= anObject
	^ self species = anObject species and: [ self description = anObject description and: [ self title = anObject title ] ]