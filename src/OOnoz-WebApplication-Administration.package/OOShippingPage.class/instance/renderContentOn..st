rendering
renderContentOn: html
	html
		tbsContainer: [ | mcqs |
			self renderTitleOn: html.
			(mcqs := self currentUser mcqs select: #hasGift)
				ifEmpty: [ self renderEmptyContentOn: html ]
				ifNotEmpty: [ self renderPanelsFor: mcqs on: html ] ]