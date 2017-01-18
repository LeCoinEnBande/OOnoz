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
							self renderMCQImageOn: html.
							self renderMCQBackgroundOn: html.
							html
								tbsRow: [ self renderMarkingSchemeSelectionOn: html.
									self renderMCQOrdererSelectionOn: html ].
							html
								tbsRow: [ self renderMCQPriceOn: html.
									self renderKindSelectionOn: html.
									self renderMCQLevelOn: html ].
							html div
								id: #'creation-challenge';
								beCentered;
								with: [ html render: self challengeComponent ] ].
					self renderFooterOn: html ] ]