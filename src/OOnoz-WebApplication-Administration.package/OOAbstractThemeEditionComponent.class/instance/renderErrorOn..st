rendering
renderErrorOn: html
	self hasBeenValidated
		ifFalse: [ ^ self ].
	[ [ self checkValidity ]
		on: OOInvalidTheme , OOIndisponibleTheme
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'Le thème n''est pas valide ! '.
					html text: e reason ] ] ]
		on: OOInvalidSubTheme , OOIndisponibleSubTheme
		do: [ :e | "bad" ]