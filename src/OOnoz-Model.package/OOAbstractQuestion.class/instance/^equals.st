comparing
= anObject
	^ self species = anObject species
		and: [ self description = anObject description and: [ self answers = anObject answers and: [ self explanation = anObject explanation and: [ self index = anObject index ] ] ] ]