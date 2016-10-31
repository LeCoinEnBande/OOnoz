accessing
mail: aString
	mail
		ifNotNil: [ ^ self
				error: 'A user should not change his mail because it is used to make some things irreversibles.' ].
	mail := aString