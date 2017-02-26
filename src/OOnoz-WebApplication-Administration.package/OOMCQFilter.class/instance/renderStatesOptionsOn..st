rendering
renderStatesOptionsOn: html
	html
		section: [ html heading
				level5;
				with: 'États'.
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepActives: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepActives.
					html label
						for: html lastId;
						with: 'Actifs' ].
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepInactives: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepInactives.
					html label
						for: html lastId;
						with: 'Innactifs' ] ]