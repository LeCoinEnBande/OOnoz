rendering
renderContentOn: html
	html div
		class: #'text-center';
		with: [ html heading: self title ].
	html hr.
	html form
		class: #'text-center';
		with: [ self renderFormContentOn: html.
			html hr.
			self renderButtonsOn: html ]