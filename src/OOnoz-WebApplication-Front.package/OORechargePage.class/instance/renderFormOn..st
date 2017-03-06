rendering
renderFormOn: html
	html
		article: [ html tbsArticlePanelHeader
				with: [ html tbsPanelTitle
						level2;
						with: 'Rechargement' ].
			html
				form: [ html section
						class: #'panel-body';
						with: [ html
								tbsFormGroup: [ html label
										for: html nextId;
										with: 'Montant à recharger'.
									html numberInput
										tbsFormControl;
										value: 5;
										callback: [ :i | self currentUser addCredits: i asInteger ] ] ].
					html
						tbsArticlePanelFooter: [ html tbsSubmitButton
								role: #button;
								bePrimary;
								with: 'Recharger' ] ] ]