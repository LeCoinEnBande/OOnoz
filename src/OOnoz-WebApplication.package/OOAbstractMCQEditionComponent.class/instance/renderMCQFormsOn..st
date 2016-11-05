rendering
renderMCQFormsOn: html
	html tbsContainer
		class: #'text-center';
		with: [ html heading
				level2;
				class: #h5;
				with: 'Configuration' ].
	self renderMCQErrorOn: html.
	html
		tbsRow: [ html tbsColumn
				mediumSize: 6;
				mediumOffset: 3;
				class: #'text-center';
				with: [ html
						tbsFormGroup: [ | id label |
							label := 'Titre du questionnaire'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: id;
								placeholder: label;
								callback: [ :title | self mcq title: title ];
								pattern: '.{5,}';
								value: self mcq title;
								rows: 1 ].
					html
						tbsFormGroup: [ | id label |
							label := 'Description du questionnaire'.
							html label
								for: (id := html nextId);
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: id;
								placeholder: label;
								callback: [ :descr | self mcq description: descr ];
								value: self mcq description;
								rows: 1 ].
					html
						tbsFormGroup: [ | group |
							group := html radioGroup.
							self markingSchemes
								do: [ :class | 
									html label
										tbsTooltip: class description;
										class: #'radio-inline';
										with: [ group radioButton
												selected: self mcq markingScheme = class;
												callback: [ self mcq markingScheme: class ];
												with: class label ] ] ] ] ]