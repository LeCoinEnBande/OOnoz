rendering
renderMCQErrorOn: html
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ self mcq validateMCQ ]
		on: OOInvalidMCQ
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'Le QCM n''est pas valide ! '.
					html text: e reason ] ]