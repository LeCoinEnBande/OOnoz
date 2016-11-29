rendering
renderCancelButtonOn: html
	| id |
	html tbsButton
		bePush;
		beDanger;
		dataToggle: 'modal';
		dataTarget: '#' , (id := html nextId);
		with: 'Annuler'.
	^ id