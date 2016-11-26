rendering
renderFormOn: html
	self mcq hasGift
		ifFalse: [ ^ self ].
	html
		tbsFormGroup: [ | label |
			label := 'Description du cadeau'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html textArea
				tbsFormControl;
				id: html lastId;
				placeholder: label;
				callback: [ :gift | self gift description: gift ];
				value: self gift description;
				rows: 1 ].
	html
		tbsFormGroup: [ | label |
			label := 'Nombre de cadeaux'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html numberInput
				tbsFormControl;
				id: html lastId;
				placeholder: label;
				min: 1;
				callback: [ :number | self gift number: number asInteger ];
				value: self gift number ]