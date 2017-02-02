rendering
renderWelcomeMessageOn: html
	html text: 'Bienvenue'.
	html break.
	html tbsAnchor
		callback: [ self rootComponent setInstanceOf: OOPlayPage ];
		beSuccess;
		with: 'Continuer'