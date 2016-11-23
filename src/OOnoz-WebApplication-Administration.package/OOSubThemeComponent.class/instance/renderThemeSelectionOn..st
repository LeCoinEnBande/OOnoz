rendering
renderThemeSelectionOn: html
	self shouldDisplayThemeSelection
		ifFalse: [ ^ self ].
	html
		tbsFormGroup: [ html select
				title: 'Thème parent';
				required;
				class: #selectpicker;
				attributeAt: 'data-width' put: '100%';
				list: OOTheme selectAll;
				labels: [ :theme | theme title ];
				callback: [ :theme | self subTheme theme: theme ];
				selected: self subTheme theme ]