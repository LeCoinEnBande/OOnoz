rendering
renderQuestionFormContentFor: anInteger on: html
	html tbsColumn
		mediumSize: 6;
		mediumOffset: 3;
		with: [ html
				tbsFormGroup: [ | group |
					group := html radioGroup.
					(OOAbstractQuestion allSubclasses select: #isQuestionKind)
						do: [ :class | 
							html label
								class: #'radio-inline';
								with: [ group radioButton
										selected: ((self questionAt: anInteger) ifNil: [ false ] ifNotNil: [ :q | class = q class ]);
										callback: [ self questionAt: anInteger put: class new.
											(self questionAt: anInteger) class minimumNumberOfAnswers timesRepeat: [ self answersAt: anInteger put: (OrderedCollection with: OOAnswer new with: OOAnswer new) ] ];
										onChange:
											(html jQuery ajax
												serializeThis;
												onSuccess: ((html jQuery id: (self questionIdFor: anInteger)) load html: [ :r | self renderQuestionFormContentFor: anInteger on: r ]));
										with: class label ] ] ].
			(self questionAt: anInteger)
				ifNotNil: [ :question | 
					html
						tbsFormGroup: [ | id label |
							label := 'Intitulé de la question ' , anInteger asString.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: id;
								placeholder: label;
								callback: [ :title | question description: title ];
								value: self mcq title;
								rows: 1 ].
					html div
						id: (self questionIdFor: anInteger) , 'Answers';
						with: [ (self answersAt: anInteger)
								doWithIndex: [ :answer :answerInd | 
									html
										tbsFormGroup: [ html
												tbsInputGroup: [ html
														tbsInputGroupAddOn: [ html checkbox
																value: answer isRight;
																callback: [ :confirmation | answer isRight: confirmation ] ].
													html textInput
														tbsFormControl;
														value: answer text;
														placeholder: 'Réponse ' , answerInd asString;
														callback: [ :text | answer text: text ] ] ] ] ] ] ]