rendering
renderChallengeButtonOn: html
	html tbsButton
		bePush;
		beInfoIf: self mcq isChallenge not;
		beDangerIf: self mcq isChallenge;
		onClick:
			((html jQuery id: 'creation-challenge') load
				html: [ :r | 
					self toggleIsChallenge.
					self renderChallengePanelOn: r ];
				onComplete: '$("input.slider").slider();' js);
		with:
			(self mcq isChallenge
				ifFalse: [ 'Transformer en QCM challenge.' ]
				ifTrue: [ 'Revenir à un QCM d''E-learning' ])