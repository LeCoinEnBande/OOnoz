rendering
renderMailInputOn: html
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
				callback: [ :mail | self user: ((OOUser selectOne: [ :u | u mail = mail address ]) ifNil: [ OONilUser new ]) ];
				value: self user mail ]