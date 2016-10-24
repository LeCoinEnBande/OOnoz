rendering
renderFormContentOn: html
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
										selected: self question class = class;
										callback: [ self question class = class
												ifFalse: [ self reinitializeQuestionFrom: class ] ];
										onChange:
											(html jQuery ajax
												serializeThis;
												onSuccess: ((html jQuery id: self id) load html: [ :r | self renderFormContentOn: r ]));
										with: class label ] ] ].
			self renderConcreteFormOn: html ]