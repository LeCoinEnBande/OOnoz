rendering
renderButtonsOn: html
	html tbsButton
		bePush;
		beDanger;
		beOutline;
		dataToggle: 'modal';
		dataTarget: '#' , html nextId;
		with: 'Quitter'.
	self renderCancelModalFor: html lastId on: html.
	html space.
	html tbsAnchor
		beOutline;
		beSuccess;
		callback: [ self finish ];
		with: 'Envoyer mes réponses'