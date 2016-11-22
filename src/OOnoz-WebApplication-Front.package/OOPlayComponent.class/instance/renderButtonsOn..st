rendering
renderButtonsOn: html
	html section
		tbsPullRight;
		with: [ html tbsAnchor
				bePrimary;
				callback: [ self call: (OOPlayMCQComponent mcq: self mcq) ];
				disabled: (self mcq isChallenge and: [ (OOMCQResult selectOne: [ :res | res user = self currentUser and: [ res mcq = self mcq ] ]) isNotNil ]);
				with: #Jouer.
			html space.
			html tbsAnchor
				beDanger;
				callback: [ self answer ];
				with: #Annuler ]