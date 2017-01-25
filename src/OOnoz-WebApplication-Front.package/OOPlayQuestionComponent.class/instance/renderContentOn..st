rendering
renderContentOn: html
	html tbsArticlePanel
		beDefault;
		with: [ self renderQuestionOn: html ]