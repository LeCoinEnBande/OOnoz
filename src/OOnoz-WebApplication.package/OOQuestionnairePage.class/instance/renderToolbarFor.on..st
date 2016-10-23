rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				beOutline;
				callback: [ (self call: OOMCQCreationComponent new)
						ifTrue: [ self message: 'Nouveau QCM créé.' ] ];
				with: 'Ajouter'.
			html space.
			self flag: #todo	"We need to check if we keep this one."
			"html tbsButton
				beDanger;
				beOutline;
				disabled;
				callback: [ self flag: #todo ];
				with: 'Supprimer'" ]