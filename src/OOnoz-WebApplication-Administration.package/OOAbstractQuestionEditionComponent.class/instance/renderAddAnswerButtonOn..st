rendering
renderAddAnswerButtonOn: html
	self shouldRenderAddAnswerButton
		ifTrue: [ ^ self ].
	html anchor
		style: 'cursor: pointer;';
		onClick:
			((html jQuery id: self panelId) load
				html: [ :r | 
					self question addEmptyAnswer.
					self renderPanelContentOn: html ];
				onComplete: self initScript);
		with: [ (html tag: 'i') class: 'fa fa-plus-circle'.
			html space.
			html text: 'Ajouter une réponse' ]