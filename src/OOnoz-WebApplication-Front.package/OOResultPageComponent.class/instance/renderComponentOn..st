rendering
renderComponentOn: html
	html tbsContainer: [ html render: (OOMCQHeaderComponent mcq: self mcqResult mcq) ].
	html
		tbsContainer: [ self renderTitleAndDescriptionOn: html.
			self renderGlobalInfosOn: html.
			self renderRatingOn: html.
			self renderQuestionsResultsOn: html ]