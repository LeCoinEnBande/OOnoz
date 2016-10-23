rendering
renderQuestionFormContentFor: anInteger on: html
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
										selected: ((self questionAt: anInteger) ifNil: [ false ] ifNotNil: [ :q | class = q class ]);
										callback: [ self questionAt: anInteger put: class new.
											(self questionAt: anInteger) class minimumNumberOfAnswers timesRepeat: [ self answersAt: anInteger put: (OrderedCollection with: OOAnswer new with: OOAnswer new) ] ];
										onChange:
											(html jQuery ajax
												serializeThis;
												onSuccess: ((html jQuery id: (self questionIdFor: anInteger)) load html: [ :r | self renderQuestionFormContentFor: anInteger on: r ]));
										with: class label ] ] ].
			self renderConcreteQuestionFormFor: anInteger on: html ]