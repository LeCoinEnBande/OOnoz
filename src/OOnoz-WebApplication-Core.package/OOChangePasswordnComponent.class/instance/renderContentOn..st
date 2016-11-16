rendering
renderContentOn: html
	html
		tbsContainer: [ html form
				class: #'text-center';
				with: [ self renderFormContentOn: html.
					html hr.
					self renderButtonsOn: html ] ]