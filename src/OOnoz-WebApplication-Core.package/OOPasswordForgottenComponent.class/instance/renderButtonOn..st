rendering
renderButtonOn: html
	html tbsButton
		beSuccess;
		beSubmit;
		callback: [ self sendNewPassword ];
		with: 'Réinitialiser le mot de passe'.
	html space.
	html tbsAnchor
		beDanger;
		callback: [ self returnToLogin ];
		with: 'Annuler'