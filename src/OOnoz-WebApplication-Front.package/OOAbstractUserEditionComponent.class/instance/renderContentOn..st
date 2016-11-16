rendering
renderContentOn: html
	self renderTitleAndDescriptionOn: html.
	html hr.
	self renderComponentContentOn: html