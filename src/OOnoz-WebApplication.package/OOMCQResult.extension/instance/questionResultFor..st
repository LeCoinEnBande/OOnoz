*OOnoz-WebApplication
questionResultFor: aQuestion
	^ self questionResults detect: [ :res | res question = aQuestion ]