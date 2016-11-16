rendering
renderContentOn: html
	html
		tbsContainer: [ self renderTitleAndDescriptionOn: html.
			html hr.
			self renderComponentContentOn: html ]