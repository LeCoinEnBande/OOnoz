rendering
renderButtonsOn: html
	html section
		tbsPullRight;
		with: [ (self mcq hasGift and: [ self mcq gift remainingGifts = 0 ])
				ifTrue: [ html tbsButton
						bePrimary;
						dataToggle: 'modal';
						dataTarget: '#' , html nextId;
						disabled: ((self mcq isChallenge and: [ self currentUser alreadyPlayedTo: self mcq ]) or: [ self currentUser credits < self mcq price ]);
						with: #Jouer.
					self renderWarningModalOn: html ]
				ifFalse: [ self renderPlayButtonOn: html ].
			html space.
			html tbsAnchor
				beDanger;
				callback: [ self answer ];
				with: #Annuler ]