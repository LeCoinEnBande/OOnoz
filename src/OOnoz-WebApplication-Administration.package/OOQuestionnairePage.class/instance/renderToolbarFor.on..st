rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				callback: [ (self call: OOMCQCreationComponent new)
						ifTrue: [ self message: 'Nouveau QCM créé.' ] ];
				with: 'Ajouter'.
			html space.
			html tbsAnchor
				beSuccess;
				callback: [ self call: OOValidationPage new ];
				with: 'Validations' ]