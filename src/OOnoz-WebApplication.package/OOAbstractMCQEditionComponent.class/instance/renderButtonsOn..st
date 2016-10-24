rendering
renderButtonsOn: html
	html tbsContainer
		class: #'text-center';
		with: [ html tbsButton
				beSuccess;
				beOutline;
				beSubmit;
				callback: [ self save ];
				with: 'Valider'.
			html space.
			html tbsButton
				beWarning;
				beOutline;
				beReset;
				with: 'Réinitialiser' ]