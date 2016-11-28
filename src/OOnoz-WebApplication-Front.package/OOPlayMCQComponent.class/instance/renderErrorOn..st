rendering
renderErrorOn: html
	html text: 'QCM déjà joué.'.
	html tbsAnchor
		callback: [ self answer: false ];
		beSuccess;
		with: 'Retour'