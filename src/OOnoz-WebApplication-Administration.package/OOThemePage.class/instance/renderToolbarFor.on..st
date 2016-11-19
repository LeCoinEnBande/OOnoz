rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				callback: [ (self call: OOThemeCreationComponent new)
						ifTrue: [ self message: 'Nouveau thème créé.' ] ];
				with: 'Ajouter' ]
