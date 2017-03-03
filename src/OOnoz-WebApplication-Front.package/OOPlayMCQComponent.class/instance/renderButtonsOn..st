rendering
renderButtonsOn: html
	html div
		style: 'margin: 10px;';
		with: [ html tbsAnchor
				beDanger;
				dataToggle: 'modal';
				dataTarget: '#' , html nextId;
				with: 'Quitter'.
			self renderCancelModalFor: html lastId on: html.
			html space.
			html tbsButton
				bePrimary;
				beSubmit;
				class: #question20;
				callback: [ self finish ];
				with: 'Envoyer mes réponses' ]