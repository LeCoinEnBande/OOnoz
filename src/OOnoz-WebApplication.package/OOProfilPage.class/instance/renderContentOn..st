rendering
renderContentOn: html
	html tbsAnchor
		beOutline;
		beSuccess;
		callback: [ self call: OOSubscriptionComponent new ];
		with: 'Inscription'.
	html space.
	html tbsAnchor
		beOutline;
		beSuccess;
		callback: [ self call: OOLoginComponent new ];
		with: 'Connexion'.
	html space.
	self isLogged
		ifTrue: [ html tbsAnchor
				beOutline;
				beSuccess;
				callback: [ self logout ];
				with: 'Deconnexion' ]