rendering
renderOldPasswordInputOn: html
	html
		tbsFormGroup: [ | id label |
			label := 'Ancien mot de passe'.
			html label
				for: (id := html nextId);
				tbsScreenReaderOnly;
				with: label.
			html passwordInput
				tbsFormControl;
				id: id;
				required;
				pattern: '(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$';
				placeholder: label;
				callback: [ :pass | self isOldPasswordValid: (self user passwordMatch: pass) ] ]