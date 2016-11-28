rendering
renderFormContentOn: html
	html section
		class: #'panel-body';
		with: [ html
				tbsRow: [ html tbsColumn
						mediumSize: 8;
						mediumOffset: 2;
						with: [ html
								tbsFormGroup: [ | group |
									group := html radioGroup.
									self questionKinds
										do: [ :class | 
											html div
												class: #radio;
												with: [ group radioButton
														id: html nextId;
														selected: self question class = class;
														callback: [ self question class = class
																ifFalse: [ self reinitializeQuestionFrom: class ] ];
														onChange:
															(html jQuery ajax
																serializeThis;
																onSuccess: ((html jQuery id: self id) load html: [ :r | self renderFormContentOn: r ])).
													html label
														tbsTooltip: class description;
														for: html lastId;
														with: class label ] ] ].
							self renderConcreteFormOn: html ] ].
			self renderFooterOn: html ]