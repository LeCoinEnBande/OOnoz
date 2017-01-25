rendering
renderContentOn: html
	html tbsArticlePanel
		id: self panelId;
		beDefault;
		with: [ self renderPanelContentOn: html ]