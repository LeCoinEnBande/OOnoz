rendering
renderButtonsOn: html
	| id |
	html tbsButton
		beSuccess;
		beOutline;
		beSubmit;
		callback: [ self save ];
		with: 'Valider'.
	html space.
	html tbsButton
		beWarning;
		beOutline;
		beReset;
		with: 'Réinitialiser'.
	html space.
	html tbsButton
		bePush;
		beDanger;
		beOutline;
		dataToggle: 'modal';
		dataTarget: '#' , (id := html nextId);
		with: 'Annuler'.
	self renderCancelModalFor: id on: html