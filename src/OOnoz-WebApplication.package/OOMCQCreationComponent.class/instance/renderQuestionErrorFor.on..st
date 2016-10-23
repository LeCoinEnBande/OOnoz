rendering
renderQuestionErrorFor: anInteger on: html
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ (self questionAt: anInteger)
		ifNil: [ OOInvalidQuestion new
				reason: 'Veuillez choisir le type de question.';
				signal ]
		ifNotNil: [ :q | q validate ] ]
		on: OOInvalidQuestion
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'La question ' , anInteger asString , ' n''est pas valide ! '.
					html text: e reason ] ]