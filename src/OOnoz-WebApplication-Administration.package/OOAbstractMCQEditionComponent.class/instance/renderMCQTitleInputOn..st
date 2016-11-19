rendering
renderMCQTitleInputOn: html
	html
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
				value: self mcq title;
				rows: 1 ]