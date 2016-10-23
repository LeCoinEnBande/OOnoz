rendering
renderQuestionErrorFor: aQuestion on: html
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ aQuestion class isAbstract 
		ifTrue: [ OOInvalidQuestion new
				reason: 'Veuillez choisir le type de question.';
				signal ]
		ifFalse: [ aQuestion validate ] ]
		on: OOInvalidQuestion
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'La question ' , aQuestion index asString , ' n''est pas valide ! '.
					html text: e reason ] ]