*OOnoz-WebApplication-Core
questionResultFor: aQuestion
	^ self questionResults detect: [ :res | res question = aQuestion ]