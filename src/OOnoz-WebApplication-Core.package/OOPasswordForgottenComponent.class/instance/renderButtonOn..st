rendering
renderButtonOn: html
	html tbsButton
		beSuccess;
		beOutline;
		beSubmit;
		callback: [ self sendNewPassword ];
		with: 'Réinitialiser le mot de passe'.
	html space.
	html tbsAnchor
		beDanger;
		callback: [ self answer ];
		with: 'Annuler'