rendering
renderUserErrorOn: html
	self hasBeenValidated ifFalse: [ ^ self ].
	
	[ self user validate ]
		on: OOInvalidUser
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'L''utilisateur n''est pas valide ! '.
					html text: e reason ] ]