rendering
renderPlayButtonOn: html
	html tbsAnchor
		bePrimary;
		callback: [ self call: (OOPlayMCQComponent mcq: self mcq) ];
		disabled: (self mcq isChallenge and: [ self currentUser alreadyPlayedTo: self mcq ]);
		with: #Jouer