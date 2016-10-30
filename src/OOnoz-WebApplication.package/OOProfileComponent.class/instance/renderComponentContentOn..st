rendering
renderComponentContentOn: html
	self renderAvatarManagementOn: html.
	html hr.
	html form
		class: #'text-center';
		with: [ self renderFormContentOn: html.
			html hr.
			self renderButtonsOn: html ].
	html hr.
	html render: self changePasswordComponent