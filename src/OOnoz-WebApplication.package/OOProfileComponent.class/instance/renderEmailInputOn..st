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
				placeholder: label;
				beReadOnly;
				value: self user mail ]