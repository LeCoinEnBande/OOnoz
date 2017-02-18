rendering
renderKindOptionsOn: html
	html heading
		level4;
		with: 'Types'.
	html tbsFormGroup
		class: 'checkbox';
		with: [ html checkbox
				callback: [ :c | self keepChallenges: c ];
				id: html nextId;
				onChange:
					(html jQuery ajax
						serializeThisCheckbox;
						onSuccess: (self refreshScript value: html));
				value: self keepChallenges.
			html label
				for: html lastId;
				with: 'Challenge' ].
	html tbsFormGroup
		class: 'checkbox';
		with: [ html checkbox
				callback: [ :c | self keepELearning: c ];
				id: html nextId;
				onChange:
					(html jQuery ajax
						serializeThisCheckbox;
						onSuccess: (self refreshScript value: html));
				value: self keepELearning.
			html label
				for: html lastId;
				with: 'E-leaning' ]