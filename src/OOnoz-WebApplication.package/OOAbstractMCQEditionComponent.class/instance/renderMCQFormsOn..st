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
				with: [ html
						tbsFormGroup: [ | label |
							label := 'Titre du questionnaire'.
							html label
								for: html nextId;
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: html lastId;
								placeholder: label;
								callback: [ :title | self mcq title: title ];
								pattern: '.{5,}';
								value: self mcq title;
								rows: 1 ].
					html
						tbsFormGroup: [ | label |
							label := 'Description du questionnaire'.
							html label
								for: html nextId;
								tbsScreenReaderOnly;
								with: label.
							html textArea
								tbsFormControl;
								id: html lastId;
								placeholder: label;
								callback: [ :descr | self mcq description: descr ];
								value: self mcq description;
								rows: 1 ].
					html
						tbsFormGroup: [
							html label
								for: html nextId;
								tbsScreenReaderOnly;
								with: 'Barème'.
							html select
								class: 'form-control';
								list: (OOAbstractMarkingSchemeStrategy allSubclasses reject: #isAbstract);
								labels: [ :each | each label ];
								selected: self mcq markingScheme;
								callback: [ :class | self mcq markingScheme: class ] ].
					html tbsFormGroup
						class: #'text-center';
						with: [ | group |
							group := html radioGroup.
							self orderers
								do: [ :class | 
									html label
										class: #'radio-inline';
										with: [ group radioButton
												selected: self mcq orderer = class;
												callback: [ self mcq orderer: class ];
												with: class label ] ] ] ] ]