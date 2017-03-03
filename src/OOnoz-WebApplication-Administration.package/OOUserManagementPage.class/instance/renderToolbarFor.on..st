rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				bePrimary;
				callback: [ (self call: OOAddUserComponent new)
						ifTrue: [ self message: 'L''utilisateur a bien été créé.' ] ];
				with: 'Ajouter' ]