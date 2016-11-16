rendering
renderForgottenPasswordLinkOn: html
	html anchor
		callback: [ self call: OOPasswordForgottenComponent new ];
		with: 'Mot de passe oublié'