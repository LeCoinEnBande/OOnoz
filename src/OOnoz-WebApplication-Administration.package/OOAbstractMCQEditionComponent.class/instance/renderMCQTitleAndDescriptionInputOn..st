rendering
renderMCQTitleAndDescriptionInputOn: html
	html
		tbsFormGroup: [ | label |
			label := 'Titre du questionnaire'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html textInput
				tbsFormControl;
				id: html lastId;
				required;
				placeholder: label;
				callback: [ :title | self mcq title: title ];
				onChange:
					(html jQuery ajax
						serializeThis;
						onSuccess: (self refreshBadgeOn: html));
				value: self mcq title ].
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
				onChange:
					(html jQuery ajax
						serializeThis;
						onSuccess: (self refreshBadgeOn: html));
				value: self mcq description;
				rows: 3 ]