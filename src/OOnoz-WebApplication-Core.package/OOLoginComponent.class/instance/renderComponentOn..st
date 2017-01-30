rendering
renderComponentOn: html
	self isLogged
		ifFalse: [ html form
				class: #'text-center';
				with: [ self renderFormContentOn: html.
					html hr.
					self renderButtonOn: html ] ]
		ifTrue:
			[ self renderWelcomeMessageOn: html ]