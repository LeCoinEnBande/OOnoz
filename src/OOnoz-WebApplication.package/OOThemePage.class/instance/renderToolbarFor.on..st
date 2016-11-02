rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				beOutline;
				callback: [ (self call: OOThemeEditionComponent new)
						ifTrue: [ self message: 'Nouveau thème créé.' ] ];
				with: 'Ajouter' ]
