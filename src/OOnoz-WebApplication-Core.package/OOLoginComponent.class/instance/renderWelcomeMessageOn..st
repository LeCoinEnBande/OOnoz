rendering
renderWelcomeMessageOn: html
	html text: 'Bienvenu'.
	html break.
	html tbsAnchor
		callback: [ self rootComponent setInstanceOf: OOPlayPage ];
		beSuccess;
		with: 'Continuer'