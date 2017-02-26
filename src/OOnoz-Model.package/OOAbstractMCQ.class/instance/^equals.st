comparing
= anObject
	^ self species = anObject species
		and: [ self sortedQuestions = anObject sortedQuestions
				and: [ self title = anObject title
						and: [ self description = anObject description
								and: [ self orderer = anObject orderer
										and:
											[ self price = anObject price and: [ self imagePath = anObject imagePath and: [ self backgroundPath = anObject backgroundPath and: [ self level = anObject level and: [ self state = anObject state ] ] ] ] ] ] ] ] ]