rendering
renderEmailInputOn: html
	html
		tbsFormGroup: [ | id label |
			label := 'Email'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html emailInput
				tbsFormControl;
				id: id;
				required;
				placeholder: label;
				callback: [ :mail | self user mail: mail address ];
				value: self user mail ]