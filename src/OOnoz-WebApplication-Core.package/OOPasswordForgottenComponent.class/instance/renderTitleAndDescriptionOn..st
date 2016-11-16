rendering
renderTitleAndDescriptionOn: html
	html div
		class: #'text-center';
		with: [ html heading: self title ]