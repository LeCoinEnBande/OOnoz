rendering
renderSubThemeSelectionOn: html
	self theme ifNil: [ ^ self ].
	html
		tbsFormGroup: [ html multiSelect
				title: 'Sous thèmes';
				required;
				class: #selectpicker;
				attributeAt: 'data-width' put: '100%';
				list: self theme subThemes;
				labels: [ :t | t title ];
				callback: [ :t | self mcq subThemes: t ];
				onChange:
					(html jQuery ajax
						serializeThisWithHidden;
						onSuccess: (self refreshBadgeOn: html));
				selected: self mcq subThemes ]