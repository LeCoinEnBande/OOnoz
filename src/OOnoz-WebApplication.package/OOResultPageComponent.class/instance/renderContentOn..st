rendering
renderContentOn: html
	self renderTitleAndDescriptionOn: html.
	self renderGlobalInfosOn: html.
	html hr.
	self renderQuestionsResultsOn: html