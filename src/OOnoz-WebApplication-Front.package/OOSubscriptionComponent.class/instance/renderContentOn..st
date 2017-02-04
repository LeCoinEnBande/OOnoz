rendering
renderContentOn: html
	html form
		id: 'form';
		class: #'text-center';
		with: [ self renderFormContentOn: html.
			html hr.
			self renderButtonsOn: html ].
	html document addLoadScript: 'initSubscriptionForm();' js