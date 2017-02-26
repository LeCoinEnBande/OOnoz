rendering
renderPriceOptionsOn: html
	html
		section: [ html heading
				level5;
				with: 'Prix'.
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepFree: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepFree.
					html label
						for: html lastId;
						with: 'Gratuits' ].
			html tbsFormGroup
				class: 'checkbox';
				with: [ html checkbox
						attributeAt: 'autocomplete' put: 'off';
						callback: [ :c | self keepProfitables: c ];
						id: html nextId;
						onChange:
							(html jQuery ajax
								serializeThisCheckbox;
								onSuccess: (self refreshScript value: html));
						value: self keepProfitables.
					html label
						for: html lastId;
						with: 'Payants' ] ]