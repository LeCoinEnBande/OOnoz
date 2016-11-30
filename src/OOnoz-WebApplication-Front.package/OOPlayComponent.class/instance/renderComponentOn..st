rendering
renderComponentOn: html
	html
		tbsContainer: [ self renderInfosOn: html.
			self renderRulesOn: html.
			self renderButtonsOn: html ]