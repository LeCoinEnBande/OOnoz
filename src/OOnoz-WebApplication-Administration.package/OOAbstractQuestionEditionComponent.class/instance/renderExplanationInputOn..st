rendering
renderExplanationInputOn: html
	self question hasCorrection
		ifFalse: [ ^ self ].
	html
		tbsFormGroup: [ html
				tbsInputGroup: [ | label |
					label := 'Explication de la réponse'.
					html label
						for: html nextId;
						tbsScreenReaderOnly;
						with: label.
					html textArea
						tbsFormControl;
						id: html lastId;
						placeholder: label;
						callback: [ :explanation | self question correction: explanation ];
						value: self question correction;
						rows: 3.
					html
						tbsInputGroupButton: [ html tbsButton
								bePush;
								beDanger;
								beLink;
								onClick:
									((html jQuery id: self answersId) load
										html: [ :r | 
											self question removeCorrection.
											self renderAnswersOn: html ];
										onComplete: '$(".checkbox").each(function(i,e){$(e).children("input[type=hidden]").prependTo(e)})' js);
								with: [ (html tag: #i)
										class: 'fa fa-times';
										ariaHidden: true ] ] ] ]