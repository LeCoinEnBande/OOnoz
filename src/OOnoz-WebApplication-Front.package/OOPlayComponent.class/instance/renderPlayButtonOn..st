rendering
renderPlayButtonOn: html
	html tbsAnchor
		bePrimary;
		callback: [ (self mcq isChallenge and: [ self currentUser alreadyPlayedTo: self mcq ])
				ifFalse: [ self currentUser credits: self currentUser credits - self mcq price ].
			self call: (OOPlayMCQComponent mcq: self mcq) ];
		disabled: ((self mcq isChallenge and: [ self currentUser alreadyPlayedTo: self mcq ]) or: [ self currentUser credits < self mcq price ]);
		with: #Jouer