rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				callback: [ (self call: OOSubscriptionComponent new)
						ifTrue: [ self message: 'L''utilisateur a bien été créé.' ] ];
				with: 'Ajouter' ]