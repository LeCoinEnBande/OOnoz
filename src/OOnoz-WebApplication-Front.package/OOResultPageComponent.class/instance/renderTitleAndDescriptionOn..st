rendering
renderTitleAndDescriptionOn: html
	html div
		class: #'text-center';
		with: [ html heading: self title.
			html tbsRow: [ html tbsColMs: 8 mo: 2 with: [ html paragraph: 'Résultat du QCM.' ] ] ]