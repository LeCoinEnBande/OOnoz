rendering
renderMCQFormsOn: html
	html tbsArticlePanel
		beDefault;
		with: [ html tbsArticlePanelHeader
				id: #configurationTitle;
				parent: #'#mcqCreation';
				toggle: #collapse;
				target: 'configuration';
				ariaExpanded: true;
				ariaControles: #configuration;
				with: [ html tbsPanelTitle
						level2;
						with: [ html text: #Configuration.
							html div
								tbsPullRight;
								class: #'accordion-status';
								id: #badge;
								with: [ self renderValidationBadgeOn: html ] ] ].
			self renderMCQErrorOn: html.
			html div
				id: #configuration;
				class: #'panel-collapse';
				class: #collapse;
				class: #in if: self isActive;
				role: #tabpanel;
				with: [ html section
						class: #'panel-body';
						with: [ self renderMCQTitleAndDescriptionInputOn: html.
							self renderThemeSelectionOn: html.
							self renderMCQPriceOn: html.
							self renderMCQImageOn: html.
							self renderMCQBackgroundOn: html.
							html tbsRow: [ self renderMCQLevelOn: html ].
							html
								tbsRow: [ self renderMarkingSchemeSelectionOn: html.
									self renderMCQOrdererSelectionOn: html.
									self renderKindSelectionOn: html ].
							html
								tbsRow: [ html tbsColumn
										extraSmallSize: 12;
										with: [ html div
												id: #challengeOption;
												class: 'collapse';
												class: 'in' if: self mcq isChallenge;
												with: [ html section
														class: 'well';
														with: [ html heading
																level6;
																with: 'Options du challenge'.
															html tbsFormGroup
																id: #'creation-challenge';
																beCentered;
																with: [ html render: self challengeComponent ] ] ] ] ] ].
					self renderFooterOn: html ] ]