accessing
mail
	^ mail ifNil: [ OOError signal: 'The mail should be set for a user.' ]