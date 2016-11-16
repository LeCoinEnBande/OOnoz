rendering
renderComponentContentOn: html
	html form
		class: #'text-center';
		with: [ self renderFormContentOn: html.
			html hr.
			self renderButtonsOn: html ]