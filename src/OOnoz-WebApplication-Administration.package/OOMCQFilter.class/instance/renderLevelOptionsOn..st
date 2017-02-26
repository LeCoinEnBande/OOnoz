rendering
renderLevelOptionsOn: html
	html
		section: [ html heading
				level5;
				with: 'Difficultés'.
			html
				tbsFormGroup: [ html multiSelect
						title: 'Niveaux';
						class: #selectpicker;
						attributeAt: 'autocomplete' put: 'off';
						attributeAt: 'data-width' put: '100%';
						list: (1 to: 5);
						labels: [ :t | 'N.' , t asString ];
						callback: [ :t | self levels: t ];
						onChange:
							(html jQuery ajax
								serializeThisWithHidden;
								onSuccess: (self refreshScript value: html));
						selected: self levels ] ]