rendering
renderButtonsOn: html
	html tbsAnchor
		beDanger;
		dataToggle: 'modal';
		dataTarget: '#' , html nextId;
		with: 'Quitter'.
	self renderCancelModalFor: html lastId on: html.
	html space.
	html tbsButton
		beSuccess;
		beSubmit;
		callback: [ self finish ];
		with: 'Envoyer mes réponses'