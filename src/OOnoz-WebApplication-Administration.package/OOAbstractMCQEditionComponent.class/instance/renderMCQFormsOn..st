rendering
renderMCQFormsOn: html
	html article
		class: #panel;
		class: #'panel-default';
		with: [ html header
				id: #configurationTitle;
				class: #'panel-heading';
				role: #tab;
				attributeAt: #'data-parent' put: #'#mcqCreation';
				attributeAt: #'data-toggle' put: #collapse;
				attributeAt: #'data-target' put: '#configuration';
				ariaExpanded: true;
				ariaControles: #configuration;
				with: [ html tbsPanelTitle
						level2;
						with: #Configuration ].
			self renderMCQErrorOn: html.
			html div
				id: #configuration;
				class: #'panel-collapse';
				class: #collapse;
				class: #in;
				role: #tabpanel;
				ariaLabelledBy: #configuration;
				with: [ html section
						class: #'panel-body';
						with: [ html
								tbsRow: [ html tbsColumn
										mediumSize: 8;
										mediumOffset: 2;
										with: [ html heading
												level3;
												with: 'Configuration Globale'.
											self renderMCQTitleInputOn: html.
											self renderMCQDescriptionInputOn: html.
											self renderThemeSelectionOn: html.
											html
												tbsRow: [ self renderMarkingSchemeSelectionOn: html.
													self renderMCQOrdererSelectionOn: html ].
											html
												tbsRow: [ self renderMCQPriceOn: html.
													self renderKindSelectionOn: html ].
											html div
												id: #'creation-challenge';
												class: #'text-center';
												with: [ html render: self challengeComponent ] ] ] ] ] ]