rendering
renderButtonsOn: html
	html section
		tbsPullRight;
		with: [ html tbsButton
				beSuccess;
				beSubmit;
				callback: [ self save ];
				with: 'Publier le questionnaire'.
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