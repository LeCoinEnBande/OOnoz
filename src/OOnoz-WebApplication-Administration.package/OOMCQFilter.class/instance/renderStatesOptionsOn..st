rendering
renderStatesOptionsOn: html
	html heading
		level4;
		with: 'États'.
	html tbsFormGroup
		class: 'checkbox';
		with: [ html checkbox
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
				callback: [ :c | self keepInactives: c ];
				id: html nextId;
				onChange:
					(html jQuery ajax
						serializeThisCheckbox;
						onSuccess: (self refreshScript value: html));
				value: self keepInactives.
			html label
				for: html lastId;
				with: 'Innactifs' ]