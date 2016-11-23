rendering
renderSubThemeSelectionOn: html
	html
		tbsFormGroup: [ html multiSelect
				title: 'Sous thèmes';
				required;
				class: #selectpicker;
				attributeAt: 'data-width' put: '100%';
				list: self theme subThemes;
				labels: [ :t | t title ];
				callback: [ :t | self mcq subThemes: t ];
				selected: self mcq subThemes ]