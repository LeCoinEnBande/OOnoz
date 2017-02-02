rendering
renderForgottenPasswordLinkOn: html
	html anchor
		callback: [ self passwordForgottenCallback ];
		with: 'Mot de passe oublié'