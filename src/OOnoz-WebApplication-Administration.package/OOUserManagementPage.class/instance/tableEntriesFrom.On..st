rendering
tableEntriesFrom: aUser On: html
	^ {aUser displayName.
	aUser role displayName.
	aUser address.
	aUser city.
	aUser state.
	aUser country.
	aUser mail.
	(aUser isActivated
		ifTrue: [ 'Oui' ]
		ifFalse: [ 'Non' ])}