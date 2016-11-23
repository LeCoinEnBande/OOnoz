rendering
renderMCQFormsOn: html
	self render: #Configuration asSubHeaderOn: html.
	self renderMCQErrorOn: html.
	html
		tbsRow: [ html tbsColumn
				mediumSize: 6;
				mediumOffset: 3;
				class: #'text-center';
				with: [ self renderMCQTitleInputOn: html.
					self renderMCQDescriptionInputOn: html.
					self renderThemeSelectionOn: html.
					self renderMarkingSchemeSelectionOn: html.
					self renderMCQOrdererSelectionOn: html.
					self renderMCQPriceOn: html.
					html render: self challengeComponent ] ]