rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				callback: [ (self owner call: OOSubThemeCreationComponent new)
						ifTrue: [ self owner message: 'Nouveau sous thème créé.' ] ];
				with: 'Ajouter un sous thème' ]