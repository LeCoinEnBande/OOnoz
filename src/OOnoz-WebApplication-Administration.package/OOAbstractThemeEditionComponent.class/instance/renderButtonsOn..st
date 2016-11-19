rendering
renderButtonsOn: html
	html tbsButton
		beSuccess;
		beSubmit;
		callback: [ self save ];
		with: 'Valider'.
	html space.
	html tbsButton
		beWarning;
		beReset;
		with: 'Réinitialiser'