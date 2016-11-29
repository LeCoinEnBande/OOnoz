rendering
renderAnswersOn: html
	self question class isAbstract
		ifTrue: [ ^ self ].
	self question renderAnswersFrom: self on: html.
	html
		tbsFormGroup: [ self renderAddAnswerButtonOn: html.
			self question hasCorrection
				ifFalse: [ html space.
					html tbsButton
						beInfo;
						bePush;
						onClick:
							((html jQuery id: self answersId) load
								html: [ :r | 
									self question correction: 'Explication'.
									self renderAnswersOn: html ];
								onComplete: '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)});autosize($(''textarea''));' js);
						with: 'Ajouter une correction' ] ].
	self renderExplanationInputOn: html