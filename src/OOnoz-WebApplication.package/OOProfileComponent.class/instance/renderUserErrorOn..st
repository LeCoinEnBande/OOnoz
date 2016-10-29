rendering
renderUserErrorOn: html
	self hasBeenValidated ifFalse: [ ^ self ].
	
	[ self checkIfUserCanBeCreated ]
		on: OOInvalidUser, OOIndisponibleUser
		do: [ :e | 
			html tbsAlert
				beDanger;
				with: [ html strong: 'L''utilisateur n''est pas valide ! '.
					html text: e reason ] ].
			
		html tbsAlert
				beDanger;
				with: [ html strong: 'L''utilisateur n''a pas été créé! '.
					html text: 'Désolé mais quelque chose s''est mal passé. Vérifiez que votre mail est valide ou réessayez plus tard.' ]