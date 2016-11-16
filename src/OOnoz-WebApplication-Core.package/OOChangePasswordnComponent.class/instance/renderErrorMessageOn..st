rendering
renderErrorMessageOn: html
	self errorMessage ifNil: [ ^ self ].
	
	html tbsAlert
		beDanger;
		with: [ html strong: 'Impossible de changer de mot de passe ! '.
			html text: self errorMessage ].
			
	self errorMessage: nil