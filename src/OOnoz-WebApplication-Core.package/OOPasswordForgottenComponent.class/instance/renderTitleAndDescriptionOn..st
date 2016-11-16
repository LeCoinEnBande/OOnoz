rendering
renderTitleAndDescriptionOn: html
	html div
		class: #'text-center';
		with: [ html heading: self title.
			html
				tbsRow: [ html tbsColumn
						mediumSize: 8;
						mediumOffset: 2;
						with: [ html paragraph: String loremIpsum ] ] ]