comparing
= anObject
	^ super = anObject
		or: [ self species = anObject species
				and: [ self mcq = anObject mcq and: [ self user = anObject user and: [ self rate = anObject rate ] ] ] ]