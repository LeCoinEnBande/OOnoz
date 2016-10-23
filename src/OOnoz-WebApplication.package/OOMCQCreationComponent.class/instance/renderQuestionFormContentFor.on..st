rendering
renderQuestionFormContentFor: aQuestion on: html
	html tbsColumn
		mediumSize: 6;
		mediumOffset: 3;
		with: [ html
				tbsFormGroup: [ | group |
					group := html radioGroup.
					self questionKinds
						do: [ :class | 
							html label
								class: #'radio-inline';
								with: [ group radioButton
										selected: aQuestion class = class;
										callback: [ aQuestion class = class
												ifFalse: [ | newQuestion |
													self mcq removeQuestion: aQuestion.
													self mcq addQuestion: (newQuestion := class new index: aQuestion index).
													class minimumNumberOfAnswers timesRepeat: [ self addEmptyAnswerAt: newQuestion ] ] ];
										onChange:
											(html jQuery ajax
												serializeThis;
												onSuccess:
													((html jQuery id: (self questionIdFor: aQuestion)) load html: [ :r | self renderQuestionFormContentFor: (self mcq questions detect: [ :q | q index = aQuestion index ]) on: r ]));
										with: class label ] ] ].
			self renderConcreteQuestionFormFor: aQuestion on: html ]