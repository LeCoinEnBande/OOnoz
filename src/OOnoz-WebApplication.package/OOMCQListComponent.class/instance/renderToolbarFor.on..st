rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				beOutline;
				callback: [ self flag: #todo ];
				with: 'Ajouter'.
			html space.
			html tbsButton
				beDanger;
				beOutline;
				disabled;
				callback: [ self flag: #todo ];
				with: 'Supprimer' ]