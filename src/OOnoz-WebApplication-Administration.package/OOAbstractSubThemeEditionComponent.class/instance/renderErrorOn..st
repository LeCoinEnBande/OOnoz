rendering
renderErrorOn: html
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ self checkValidity ]
		on: OOInvalidSubTheme , OOUnavailableSubTheme
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'Le sous thème n''est pas valide ! '.
					html text: e reason ] ]