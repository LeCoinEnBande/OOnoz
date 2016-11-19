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
		with: 'Réinitialiser'.
	html space.
	html tbsButton
		bePush;
		beDanger;
		dataToggle: 'modal';
		dataTarget: '#' , html nextId;
		with: 'Annuler'