rendering
renderMCQPriceOn: html
	html
		tbsFormGroup: [ | label |
			label := 'Prix (en crédit)'.
			html label
				for: html nextId;
				tbsScreenReaderOnly;
				with: label.
			html numberInput
				tbsFormControl;
				id: html lastId;
				placeholder: label;
				required;
				callback: [ :price | self mcq price: price asInteger ];
				min: 0;
				max: 20;
				value: self mcq price asString ]