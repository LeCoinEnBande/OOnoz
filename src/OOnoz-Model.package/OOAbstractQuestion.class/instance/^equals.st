comparing
= anObject
	^ self species = anObject species and: [ self description = anObject description and: [ 
			self sortedAnswers = anObject sortedAnswers and: [ 
				self explanation = anObject explanation and: [ self index = anObject index ] ] ] ]