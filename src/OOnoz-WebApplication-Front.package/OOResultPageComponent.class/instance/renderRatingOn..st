rendering
renderRatingOn: html
	html
		tbsRow: [ html
				tbsColMs: 8 mo: 2 beCentered;
				with: [ html
						form: [ html label
								for: html nextId;
								with: 'Votre note: '.
							html space.
							html hiddenInput
								class: #rating;
								id: html lastId;
								callback: [ :rate | 
									(OOMCQRate rateObjectOf: self currentUser for: self mcqResult mcq)
										rate: rate asNumber;
										save ];
								onChange: html jQuery ajax serializeThis;
								attributeAt: 'data-fractions' put: 2;
								value: (OOMCQRate rateObjectOf: self currentUser for: self mcqResult mcq) rate ] ] ]