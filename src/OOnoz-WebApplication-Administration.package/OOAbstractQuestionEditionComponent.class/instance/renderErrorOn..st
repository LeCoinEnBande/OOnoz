rendering
renderErrorOn: html
	self owner hasBeenValidated
		ifFalse: [ ^ self ].
	[ self question class isAbstract
		ifTrue: [ OOInvalidQuestion new
				reason: 'Veuillez choisir le type de question.';
				signal ]
		ifFalse: [ self question validate ] ]
		on: OOInvalidQuestion
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'La question ' , self question index asString , ' n''est pas valide ! '.
					html text: e reason ] ]