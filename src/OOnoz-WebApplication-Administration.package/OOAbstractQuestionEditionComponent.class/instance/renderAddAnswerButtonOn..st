rendering
renderAddAnswerButtonOn: html
	self shouldRenderAddAnswerButton
		ifTrue: [ ^ self ].
	html tbsButton
		bePrimary;
		bePush;
		onClick:
			((html jQuery id: self panelId) load
				html: [ :r | 
					self question addEmptyAnswer.
					self renderPanelContentOn: html ];
				onComplete: self initScript);
		with: 'Ajouter une réponse'