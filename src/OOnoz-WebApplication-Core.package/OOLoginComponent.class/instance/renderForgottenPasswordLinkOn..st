rendering
renderForgottenPasswordLinkOn: html
	html anchor
		callback: [ self rootComponent setInstanceOf: OOPasswordForgottenComponent ];
		with: 'Mot de passe oublié'