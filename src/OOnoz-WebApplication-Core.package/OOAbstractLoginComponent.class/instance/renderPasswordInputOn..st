rendering
renderPasswordInputOn: html
	html
		tbsFormGroup: [ | id label |
			label := 'Mot de passe'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html passwordInput
				tbsFormControl;
				id: id;
				required;
				placeholder: label;
				callback: [ :pass | 
					(self user isNotNil and: [ self user passwordMatch: pass ])
						ifFalse: [ self resetUser ] ] ]