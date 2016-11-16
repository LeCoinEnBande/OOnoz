rendering
renderContentOn: html
	html
		tbsContainer: [ html tbsAnchor
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
			self isLogged
				ifTrue: [ html space.
					html tbsAnchor
						beOutline;
						beSuccess;
						callback: [ self logout ];
						with: 'Deconnexion' ].
			html space.
			html tbsAnchor
				beOutline;
				beSuccess;
				callback: [ self call: OOProfileComponent new ];
				with: 'Profil' ]