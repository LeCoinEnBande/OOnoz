rendering
renderErrorOn: html
	self hasBeenValidated ifFalse: [ ^ self ].
	
	html tbsAlert
		beDanger;
		with: [ html strong: 'Identification impossible.'.
			html text: 'L''utilisateur ou le mot de passe est incorrect.' ]