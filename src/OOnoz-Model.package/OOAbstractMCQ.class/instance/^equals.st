comparing
= anObject
	^ self species = anObject species
		and: [ self questions = anObject questions
				and: [ self title = anObject title
						and: [ self description = anObject description and: [ self orderer = anObject orderer and: [ self price = anObject price ] ] ] ] ]