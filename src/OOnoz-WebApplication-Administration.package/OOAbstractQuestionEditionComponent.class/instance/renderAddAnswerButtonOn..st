rendering
renderAddAnswerButtonOn: html
	self shouldRenderAddAnswerButton
		ifTrue: [ ^ self ].
	html tbsButton
		bePrimary;
		bePush;
		onClick:
			((html jQuery id: self answersId) load
				html: [ :r | 
					self question addEmptyAnswer.
					self renderAnswersOn: html ];
				onComplete: '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})' js)
				, (self refreshBadgeScriptOn: html);
		with: 'Ajouter une réponse'