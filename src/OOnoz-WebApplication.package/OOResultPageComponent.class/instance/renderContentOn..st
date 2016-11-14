rendering
renderContentOn: html
	html tbsContainer: [ html render: (OOMCQHeaderComponent mcq: self mcqResult mcq) ].
	html
		tbsContainer: [ self renderTitleAndDescriptionOn: html.
			self renderGlobalInfosOn: html.
			self renderQuestionsResultsOn: html ]