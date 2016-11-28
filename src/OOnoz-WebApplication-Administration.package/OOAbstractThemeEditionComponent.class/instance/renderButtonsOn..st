rendering
renderButtonsOn: html
	html tbsButton
		beSuccess;
		beSubmit;
		callback: [ self save ];
		with: 'Publier le thème'.
	html space.
	html tbsButton
		beWarning;
		beReset;
		with: 'Réinitialiser'.
	html space