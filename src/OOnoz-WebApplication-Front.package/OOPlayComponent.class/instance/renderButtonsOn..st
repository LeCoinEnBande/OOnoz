rendering
renderButtonsOn: html
	html section
		tbsPullRight;
		with: [ html tbsAnchor
				bePrimary;
				callback: [ self call: (OOPlayMCQComponent mcq: self mcq) ];
				disabled: (self mcq isChallenge and: [ self currentUser alreadyPlayedTo: self mcq ]);
				with: #Jouer.
			html space.
			html tbsAnchor
				beDanger;
				callback: [ self answer ];
				with: #Annuler ]