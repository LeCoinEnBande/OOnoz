rendering
renderErrorOn: html
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ self checkValidity ]
		on: OOInvalidSubTheme , OOIndisponibleSubTheme
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'Le sous thème n''est pas valide ! '.
					html text: e reason ] ]