rendering
renderButtonsOn: html
	html section
		tbsPullRight;
		with: [ self currentUser isAdmin
				ifTrue: [ html tbsButton
						beSuccess;
						beSubmit;
						callback: [ self mcq state: #active.
							self save ];
						with: 'Publier le questionnaire' ]
				ifFalse: [ html tbsButton
						beSuccess;
						beSubmit;
						callback: [ self mcq state: #undefined.
							self save ];
						with: 'Soumettre le questionnaire' ].
			html space.
			html tbsButton
				beWarning;
				beReset;
				with: 'Réinitialiser'.
			html space.
			html tbsButton
				bePush;
				beDanger;
				dataToggle: 'modal';
				dataTarget: '#' , self modalId;
				with: #Annuler ]