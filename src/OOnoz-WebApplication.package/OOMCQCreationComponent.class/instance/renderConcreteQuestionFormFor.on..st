rendering
renderConcreteQuestionFormFor: aQuestion on: html
	aQuestion class isAbstract ifTrue: [ ^ self ].
	
	html
		tbsFormGroup: [ | id label |
			label := 'Intitulé de la question ' , aQuestion index asString.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html textArea
				tbsFormControl;
				id: id;
				placeholder: label;
				callback: [ :title | aQuestion description: title ];
				value: aQuestion description;
				rows: 1 ].
	html div
		id: (self answersIdFor: aQuestion);
		with: [ self renderAnswersFor: aQuestion on: html ]