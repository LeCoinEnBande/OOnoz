rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beDanger;
				callback: [ self answer ];
				with: 'Retour en arrière' ]