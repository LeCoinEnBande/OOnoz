accessing
mail
	^ mail ifNil: [ self error: 'The mail should be set for a user.' ]