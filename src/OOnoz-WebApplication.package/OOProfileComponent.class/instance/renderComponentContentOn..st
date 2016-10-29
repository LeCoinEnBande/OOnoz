rendering
renderComponentContentOn: html
	self renderAvatarManagementOn: html.
	html hr.
	html form
		class: #'text-center';
		with: [ self renderInfosFormContentOn: html.
			html hr.
			self renderButtonsOn: html ].
	html hr.
	html form
		class: #'text-center';
		with: [ self renderPasswordFormContentOn: html.
			html hr.
			self renderPasswordButtonsOn: html ]