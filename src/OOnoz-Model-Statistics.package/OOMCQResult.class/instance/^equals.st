comparing
= anObject
	^ self species = anObject species
		and: [ self user = anObject user and: [ self mcq = anObject mcq and: [ self dateBegin = anObject dateBegin ] ] ]