rendering
renderMCQDescriptionInputOn: html
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
				rows: 3 ]