rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				bePrimary;
				callback: [ (self call: OOThemeCreationComponent new)
						ifTrue: [ self message: 'Nouveau thème créé.' ] ];
				with: 'Ajouter un thème' ]