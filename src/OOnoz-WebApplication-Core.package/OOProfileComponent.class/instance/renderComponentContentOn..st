rendering
renderComponentContentOn: html
	self renderAvatarManagementOn: html.
	html hr.
	html form
		class: #'text-center';
		with: [ self renderFormContentOn: html.
			self renderButtonsOn: html ].
	html hr.
	html render: self changePasswordComponent