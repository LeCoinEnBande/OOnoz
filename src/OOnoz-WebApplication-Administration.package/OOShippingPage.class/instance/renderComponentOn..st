rendering
renderComponentOn: html
	html
		tbsContainer: [ | mcqs |
			(mcqs := self currentUser mcqs select: #hasGift)
				ifEmpty: [ self renderEmptyContentOn: html ]
				ifNotEmpty: [ self renderPanelsFor: mcqs on: html ] ]