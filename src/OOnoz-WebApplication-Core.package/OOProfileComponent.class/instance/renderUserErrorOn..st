rendering
renderUserErrorOn: html
	self hasBeenValidated ifFalse: [ ^ self ].
	
	[ self user validate ]
		on: OOInvalidUser
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'L''utilisateur n''est pas valide ! '.
					html text: e reason ] ].
			
	html tbsAlert
		beDanger;
		with: [ html strong: 'L''utilisateur n''a pas été édité ! '.
			html text: 'Désolé mais quelque chose s''est mal passé. Vérifiez que votre mail est valide ou réessayez plus tard.' ]