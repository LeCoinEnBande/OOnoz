rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				callback: [ (self call: OOThemeCreationComponent new)
						ifTrue: [ self message: 'Nouveau thème créé.' ] ];
				with: 'Ajouter un thème'.
			html space.
			html tbsAnchor
				beSuccess;
				callback: [ (self call: OOSubThemeCreationComponent new)
						ifTrue: [ self message: 'Nouveau sous thème créé.' ] ];
				with: 'Ajouter un sous thème'.
			html space.
			html tbsAnchor
				beSuccess;
				callback: [ self call: (OOSubThemeEditionComponent subTheme: (OOTheme selectOne: [ :t | t subThemes isNotEmpty ]) subThemes anyOne) ];
				with: 'Éditer un sous thème aléatoire' ]