rendering
renderToolbarFor: anId on: html
	html section
		id: anId;
		with: [ html tbsAnchor
				beSuccess;
				callback: [ (self call: OOMCQCreationComponent new)
						ifTrue: [ self
								message:
									(self currentUser isAdmin
										ifTrue: [ 'Nouveau QCM créé.' ]
										ifFalse: [ 'Votre QCM à été soumis à validation d''un administrateur.' ]) ] ];
				with: 'Ajouter'.
			self currentUser can validateMCQs
				ifTrue: [ html space.
					html tbsAnchor
						beSuccess;
						callback: [ self call: OOValidationPage new ];
						with: 'Validations' ] ]